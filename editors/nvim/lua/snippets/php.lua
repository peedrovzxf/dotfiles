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

]], { i(1, "App\\Models") })),

    s("use", fmt([[
use {};
]], { i(1, "App\\Models\\User") })),

    -- ── Class ──────────────────────────────────────────────────────────────────
    s("class", fmt([[
class {}
{{
    {}
}}
]], { i(1, "ClassName"), i(2) })),

    s("classi", fmt([[
class {} implements {}
{{
    {}
}}
]], { i(1, "ClassName"), i(2, "SomeInterface"), i(3) })),

    s("classe", fmt([[
class {} extends {}
{{
    {}
}}
]], { i(1, "ClassName"), i(2, "ParentClass"), i(3) })),

    s("classei", fmt([[
class {} extends {} implements {}
{{
    {}
}}
]], { i(1, "ClassName"), i(2, "ParentClass"), i(3, "SomeInterface"), i(4) })),

    -- ── Final class ────────────────────────────────────────────────────────────
    s("fclass", fmt([[
final class {}
{{
    {}
}}
]], { i(1, "ClassName"), i(2) })),

    s("fclassi", fmt([[
final class {} implements {}
{{
    {}
}}
]], { i(1, "ClassName"), i(2, "SomeInterface"), i(3) })),

    -- ── Abstract class ─────────────────────────────────────────────────────────
    s("aclass", fmt([[
abstract class {}
{{
    {}
}}
]], { i(1, "ClassName"), i(2) })),

    -- ── Interface ──────────────────────────────────────────────────────────────
    s("iface", fmt([[
interface {}
{{
    {}
}}
]], { i(1, "InterfaceName"), i(2) })),

    s("ifacee", fmt([[
interface {} extends {}
{{
    {}
}}
]], { i(1, "InterfaceName"), i(2, "ParentInterface"), i(3) })),

    -- ── Trait ──────────────────────────────────────────────────────────────────
    s("trait", fmt([[
trait {}
{{
    {}
}}
]], { i(1, "TraitName"), i(2) })),

    s("usetrait", fmt([[
use {};
]], { i(1, "SomeTrait") })),

    -- ── Constructor ────────────────────────────────────────────────────────────
    s("ctor", fmt([[
public function __construct({})
{{
    {}
}}
]], { i(1), i(2) })),

    -- ── Métodos ────────────────────────────────────────────────────────────────
    s("pub", fmt([[
public function {}({}): {}
{{
    {}
}}
]], { i(1, "methodName"), i(2), i(3, "void"), i(4) })),

    s("pro", fmt([[
protected function {}({}): {}
{{
    {}
}}
]], { i(1, "methodName"), i(2), i(3, "void"), i(4) })),

    s("priv", fmt([[
private function {}({}): {}
{{
    {}
}}
]], { i(1, "methodName"), i(2), i(3, "void"), i(4) })),

    s("stat", fmt([[
public static function {}({}): {}
{{
    {}
}}
]], { i(1, "methodName"), i(2), i(3, "self"), i(4) })),

    s("abst", fmt([[
abstract public function {}({}): {};
]], { i(1, "methodName"), i(2), i(3, "void") })),

    s("fmet", fmt([[
final public function {}({}): {}
{{
    {}
}}
]], { i(1, "methodName"), i(2), i(3, "void"), i(4) })),

    -- ── Getter / Setter ────────────────────────────────────────────────────────
    s("get", fmt([[
public function get{}(): {}
{{
    return $this->{};
}}
]], {
        i(1, "Name"),
        i(2, "string"),
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
        i(2, "string"),
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
        i(2, "string"),
        f(function(args)
            local n = args[1][1]; return n:sub(1, 1):lower() .. n:sub(2)
        end, { 1 }),
        rep(1),
        rep(2),
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

    -- ── Propiedades ────────────────────────────────────────────────────────────
    s("prop", fmt([[
$this->{} = ${};
]], {
        i(1, "name"),
        rep(1),
    })),

    s("props", fmt([[
{} {} ${} = {};
]], {
        c(1, { t("private"), t("protected"), t("public") }),
        i(2, "string"),
        i(3, "name"),
        i(4, "''"),
    })),

    s("const", fmt([[
public const {} = {};
]], { i(1, "NAME"), i(2, "''") })),

    -- ── Named constructor (static factory) ────────────────────────────────────
    s("namedctor", fmt([[
public static function {}({}): self
{{
    return new self({});
}}
]], { i(1, "fromArray"), i(2), i(3) })),

    -- ── Singleton ─────────────────────────────────────────────────────────────
    s("singleton", fmt([[
final class {}
{{
    private static ?self $instance = null;

    private function __construct() {{}}

    public static function getInstance(): self
    {{
        if (self::$instance === null) {{
            self::$instance = new self();
        }}
        return self::$instance;
    }}
}}
]], { i(1, "Singleton") })),

    -- ── Magic methods ──────────────────────────────────────────────────────────
    s("tostr", fmt([[
public function __toString(): string
{{
    return {};
}}
]], { i(1, "''") })),

    s("invoke", fmt([[
public function __invoke({}): {}
{{
    {}
}}
]], { i(1), i(2, "void"), i(3) })),

    s("clone", t({
        "public function __clone()",
        "{",
        "    // deep clone si es necesario",
        "}",
    })),

    s("mget", fmt([[
public function __get(string $name)
{{
    return $this->data[$name] ?? null;
}}
]], {})),

    s("mset", fmt([[
public function __set(string $name, $value): void
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
]], { i(1, "Description"), i(2, "string"), i(3, "param"), i(4, "void") })),

    s("docvar", fmt([[
/** @var {} */
]], { i(1, "string") })),

    -- ── Namespace completo con class ───────────────────────────────────────────
    s("phpclass", fmt([[
<?php

declare(strict_types=1);

namespace {};

class {}
{{
    {}
}}
]], { i(1, "App\\Models"), i(2, "ClassName"), i(3) })),

    s("phpfinal", fmt([[
<?php

declare(strict_types=1);

namespace {};

final class {}
{{
    {}
}}
]], { i(1, "App\\Models"), i(2, "ClassName"), i(3) })),

    s("phpface", fmt([[
<?php

declare(strict_types=1);

namespace {};

interface {}
{{
    {}
}}
]], { i(1, "App\\Contracts"), i(2, "InterfaceName"), i(3) })),

    s("phptrait", fmt([[
<?php

declare(strict_types=1);

namespace {};

trait {}
{{
    {}
}}
]], { i(1, "App\\Traits"), i(2, "TraitName"), i(3) })),

})
