local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("php", {

    -- ── Namespace + use ────────────────────────────────────────────────────────
    s("ns", fmt([[
namespace {};

]], { i(0, "App\\Models") })),

    s("use", fmt([[
use {};
]], { i(0, "App\\Models\\User") })),

    -- ── Class ──────────────────────────────────────────────────────────────────
    s("class", fmt([[
class {}
{{
    {}
}}
]], { i(1, "ClassName"), i(0) })),

    s("classi", fmt([[
class {} implements {}
{{
    {}
}}
]], { i(1, "ClassName"), i(2, "SomeInterface"), i(0) })),

    s("classe", fmt([[
class {} extends {}
{{
    {}
}}
]], { i(1, "ClassName"), i(2, "ParentClass"), i(0) })),

    s("classei", fmt([[
class {} extends {} implements {}
{{
    {}
}}
]], { i(1, "ClassName"), i(2, "ParentClass"), i(3, "SomeInterface"), i(0) })),

    -- ── Final class ────────────────────────────────────────────────────────────
    s("fclass", fmt([[
final class {}
{{
    {}
}}
]], { i(1, "ClassName"), i(0) })),

    s("fclassi", fmt([[
final class {} implements {}
{{
    {}
}}
]], { i(1, "ClassName"), i(2, "SomeInterface"), i(0) })),

    -- ── Abstract class ─────────────────────────────────────────────────────────
    s("aclass", fmt([[
abstract class {}
{{
    {}
}}
]], { i(1, "ClassName"), i(0) })),

    -- ── Interface ──────────────────────────────────────────────────────────────
    s("iface", fmt([[
interface {}
{{
    {}
}}
]], { i(1, "InterfaceName"), i(0) })),

    s("ifacee", fmt([[
interface {} extends {}
{{
    {}
}}
]], { i(1, "InterfaceName"), i(2, "ParentInterface"), i(0) })),

    -- ── Trait ──────────────────────────────────────────────────────────────────
    s("trait", fmt([[
trait {}
{{
    {}
}}
]], { i(1, "TraitName"), i(0) })),

    s("usetrait", fmt([[
use {};
]], { i(0, "SomeTrait") })),

    -- ── Enum (PHP 8.1+) ──────────────────────────────────────────────────────────
    s("enum", fmt([[
enum {}
{{
    case {};
}}
]], { i(1, "Status"), i(0, "Active") })),

    s("enumb", fmt([[
enum {}: {}
{{
    case {} = {};

    public function label(): string
    {{
        return match ($this) {{
            self::{} => {},
        }};
    }}
}}
]], {
        i(1, "Status"),
        c(2, { t("string"), t("int") }),
        i(3, "Active"),
        i(4, "'active'"),
        rep(3),
        i(0, "'Active'"),
    })),

    s("enumi", fmt([[
enum {}{} implements {}
{{
    case {};
}}
]], {
        i(1, "Status"),
        c(2, { t(""), t(": string"), t(": int") }),
        i(3, "SomeInterface"),
        i(0, "Active"),
    })),

    -- ── Constructor (property promotion por defecto, PHP 8+) ───────────────────
    s("ctor", fmt([[
public function __construct(
    {}{} {} ${},
) {{
    {}
}}
]], {
        c(1, { t("private"), t("protected"), t("public"), t("private readonly"), t("public readonly") }),
        t(""),
        i(2, "string"),
        i(3, "name"),
        i(0),
    })),

    -- constructor clásico (sin promoción), por si se necesita
    s("ctorold", fmt([[
public function __construct({})
{{
    {}
}}
]], { i(1), i(0) })),

    -- ── Métodos ────────────────────────────────────────────────────────────────
    s("pub", fmt([[
public function {}({}): {}
{{
    {}
}}
]], { i(1, "methodName"), i(2), i(3, "void"), i(0) })),

    s("pro", fmt([[
protected function {}({}): {}
{{
    {}
}}
]], { i(1, "methodName"), i(2), i(3, "void"), i(0) })),

    s("priv", fmt([[
private function {}({}): {}
{{
    {}
}}
]], { i(1, "methodName"), i(2), i(3, "void"), i(0) })),

    s("stat", fmt([[
public static function {}({}): {}
{{
    {}
}}
]], { i(1, "methodName"), i(2), i(3, "self"), i(0) })),

    s("abst", fmt([[
abstract public function {}({}): {};
]], { i(1, "methodName"), i(2), i(0, "void") })),

    s("fmet", fmt([[
final public function {}({}): {}
{{
    {}
}}
]], { i(1, "methodName"), i(2), i(3, "void"), i(0) })),

    -- función que nunca retorna (PHP 8.1+)
    s("nevr", fmt([[
public function {}({}): never
{{
    throw new {}({});
}}
]], { i(1, "methodName"), i(2), i(3, "\\RuntimeException"), i(0) })),

    -- ── Getter / Setter ────────────────────────────────────────────────────────
    s("get", fmt([[
public function get{}(): {}
{{
    return $this->{};
}}
]], {
        i(1, "Name"),
        i(0, "string"),
        f(function(args)
            local name = args[1][1]
            return name:sub(1, 1):lower() .. name:sub(2)
        end, { 1 }),
    })),

    s("set", fmt([[
public function set{}({} ${}): void
{{
    $this->{} = ${};
}}
]], {
        i(1, "Name"),
        i(0, "string"),
        f(function(args)
            local name = args[1][1]
            return name:sub(1, 1):lower() .. name:sub(2)
        end, { 1 }),
        f(function(args)
            local name = args[1][1]
            return name:sub(1, 1):lower() .. name:sub(2)
        end, { 1 }),
        f(function(args)
            local name = args[1][1]
            return name:sub(1, 1):lower() .. name:sub(2)
        end, { 1 }),
    })),

    s("getset", fmt([[
public function get{}(): {}
{{
    return $this->{};
}}

public function set{}({} ${}): void
{{
    $this->{} = ${};
}}
]], {
        i(1, "Name"),
        i(0, "string"),
        f(function(args)
            local n = args[1][1]; return n:sub(1, 1):lower() .. n:sub(2)
        end, { 1 }),
        rep(1),
        rep(0),
        f(function(args)
            local n = args[1][1]; return n:sub(1, 1):lower() .. n:sub(2)
        end, { 1 }),
        f(function(args)
            local n = args[1][1]; return n:sub(1, 1):lower() .. n:sub(2)
        end, { 1 }),
        f(function(args)
            local n = args[1][1]; return n:sub(1, 1):lower() .. n:sub(2)
        end, { 1 }),
    })),

    -- ── Property hooks (PHP 8.4) ─────────────────────────────────────────────────
    s("hook", fmt([[
public {} ${} {{
    get {};
    set {};
}}
]], {
        i(1, "string"),
        i(2, "name"),
        i(3, "=> $this->name;"),
        i(0, "=> $this->name = strtolower($value);"),
    })),

    s("hookget", fmt([[
public {} ${} {{
    get {};
}}
]], { i(1, "string"), i(2, "name"), i(0, "=> $this->name;") })),

    -- ── Visibilidad asimétrica (PHP 8.4) ─────────────────────────────────────────
    s("aset", fmt([[
public private(set) {} ${};
]], { i(1, "string"), i(0, "name") })),

    -- ── Propiedades ────────────────────────────────────────────────────────────
    s("prop", fmt([[
$this->{} = ${};
]], {
        i(0, "name"),
        rep(0),
    })),

    s("props", fmt([[
{} {}{} ${} = {};
]], {
        c(1, { t("private"), t("protected"), t("public") }),
        c(2, { t(""), t("readonly ") }),
        i(3, "string"),
        i(4, "name"),
        i(0, "''"),
    })),

    s("const", fmt([[
public const {} {} = {};
]], { c(1, { t(""), t("string"), t("int"), t("array") }), i(2, "NAME"), i(0, "''") })),

    -- ── Named constructor (static factory) ────────────────────────────────────
    s("namedctor", fmt([[
public static function {}({}): self
{{
    return new self({});
}}
]], { i(1, "fromArray"), i(2), i(0) })),

    -- ── Match expression (PHP 8+) ─────────────────────────────────────────────────
    s("match", fmt([[
${} = match ({}) {{
    {} => {},
    default => {},
}};
]], { i(1, "result"), i(2, "value"), i(3, "1"), i(4, "'one'"), i(0, "null") })),

    -- ── Singleton ─────────────────────────────────────────────────────────────
    s("singleton", fmt([[
final class {}
{{
    private static ?self $instance = null;

    private function __construct() {{}}

    public static function getInstance(): self
    {{
        return self::$instance ??= new self();
    }}
}}
]], { i(0, "Singleton") })),

    -- ── Magic methods ──────────────────────────────────────────────────────────
    s("tostr", fmt([[
public function __toString(): string
{{
    return {};
}}
]], { i(0, "''") })),

    s("invoke", fmt([[
public function __invoke({}): {}
{{
    {}
}}
]], { i(1), i(2, "void"), i(0) })),

    s("clone", t({
        "public function __clone(): void",
        "{",
        "    // deep clone si es necesario",
        "}",
    })),

    s("mget", fmt([[
public function __get(string $name): mixed
{{
    return $this->data[$name] ?? null;
}}
]], {})),

    s("mset", fmt([[
public function __set(string $name, mixed $value): void
{{
    $this->data[$name] = $value;
}}
]], {})),

    -- ── Docblock ───────────────────────────────────────────────────────────────
    s("doc", fmt([[
/**
 * {}
 *
 * @param {} ${}
 * @return {}
 */
]], { i(1, "Description"), i(2, "string"), i(3, "param"), i(0, "void") })),

    s("docvar", fmt([[
/** @var {} */
]], { i(0, "string") })),

    -- ── Atributos (PHP 8+) ─────────────────────────────────────────────────────
    s("attr", fmt([[
#[{}]
]], { i(0, "Attribute") })),

    -- ── Namespace completo con class ───────────────────────────────────────────
    s("phpclass", fmt([[
<?php

declare(strict_types=1);

namespace {};

class {}
{{
    {}
}}
]], { i(1, "App\\Models"), i(2, "ClassName"), i(0) })),

    s("phpfinal", fmt([[
<?php

declare(strict_types=1);

namespace {};

final class {}
{{
    {}
}}
]], { i(1, "App\\Models"), i(2, "ClassName"), i(0) })),

    s("phpface", fmt([[
<?php

declare(strict_types=1);

namespace {};

interface {}
{{
    {}
}}
]], { i(1, "App\\Contracts"), i(2, "InterfaceName"), i(0) })),

    s("phptrait", fmt([[
<?php

declare(strict_types=1);

namespace {};

trait {}
{{
    {}
}}
]], { i(1, "App\\Traits"), i(2, "TraitName"), i(0) })),

    s("phpenum", fmt([[
<?php

declare(strict_types=1);

namespace {};

enum {}: {}
{{
    case {} = {};
}}
]], { i(1, "App\\Enums"), i(2, "EnumName"), c(3, { t("string"), t("int") }), i(4, "Active"), i(0, "'active'") })),

})
