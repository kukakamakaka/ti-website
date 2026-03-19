<?php

use Twig\Environment;
use Twig\Error\LoaderError;
use Twig\Error\RuntimeError;
use Twig\Extension\SandboxExtension;
use Twig\Markup;
use Twig\Sandbox\SecurityError;
use Twig\Sandbox\SecurityNotAllowedTagError;
use Twig\Sandbox\SecurityNotAllowedFilterError;
use Twig\Sandbox\SecurityNotAllowedFunctionError;
use Twig\Source;
use Twig\Template;

/* /Applications/MAMP/htdocs/template-october/themes/demo/partials/site/head.htm */
class __TwigTemplate_786d68ffe84c003fe99dcbecfa66eba2dca6ea03ecd5a2360e4ee6f6b5c7fac9 extends \Twig\Template
{
    private $source;
    private $macros = [];

    public function __construct(Environment $env)
    {
        parent::__construct($env);

        $this->source = $this->getSourceContext();

        $this->parent = false;

        $this->blocks = [
        ];
        $this->sandbox = $this->env->getExtension('\Twig\Extension\SandboxExtension');
        $this->checkSecurity();
    }

    protected function doDisplay(array $context, array $blocks = [])
    {
        $macros = $this->macros;
        // line 1
        echo "<title>";
        echo twig_escape_filter($this->env, $this->sandbox->ensureToStringAllowed(twig_get_attribute($this->env, $this->source, twig_get_attribute($this->env, $this->source, ($context["this"] ?? null), "page", [], "any", false, false, true, 1), "meta_title", [], "any", false, false, true, 1), 1, $this->source), "html", null, true);
        echo "</title>
<meta name=\"description\" content=\"";
        // line 2
        echo twig_escape_filter($this->env, $this->sandbox->ensureToStringAllowed(twig_get_attribute($this->env, $this->source, twig_get_attribute($this->env, $this->source, ($context["this"] ?? null), "page", [], "any", false, false, true, 2), "meta_description", [], "any", false, false, true, 2), 2, $this->source), "html", null, true);
        echo "\" />
<meta name=\"title\" content=\"";
        // line 3
        echo twig_escape_filter($this->env, $this->sandbox->ensureToStringAllowed(twig_get_attribute($this->env, $this->source, twig_get_attribute($this->env, $this->source, ($context["this"] ?? null), "page", [], "any", false, false, true, 3), "meta_title", [], "any", false, false, true, 3), 3, $this->source), "html", null, true);
        echo "\" />
<link href=\"";
        // line 4
        echo $this->extensions['Cms\Twig\Extension']->pageFilter($this->sandbox->ensureToStringAllowed(twig_get_attribute($this->env, $this->source, twig_get_attribute($this->env, $this->source, ($context["this"] ?? null), "page", [], "any", false, false, true, 4), "id", [], "any", false, false, true, 4), 4, $this->source));
        echo "\" rel=\"canonical\" />
<meta name=\"og:title\" content=\"";
        // line 5
        echo twig_escape_filter($this->env, $this->sandbox->ensureToStringAllowed(twig_get_attribute($this->env, $this->source, twig_get_attribute($this->env, $this->source, ($context["this"] ?? null), "page", [], "any", false, false, true, 5), "meta_title", [], "any", false, false, true, 5), 5, $this->source), "html", null, true);
        echo "\" />
<meta name=\"og:description\" content=\"";
        // line 6
        echo twig_escape_filter($this->env, $this->sandbox->ensureToStringAllowed(twig_get_attribute($this->env, $this->source, twig_get_attribute($this->env, $this->source, ($context["this"] ?? null), "page", [], "any", false, false, true, 6), "meta_description", [], "any", false, false, true, 6), 6, $this->source), "html", null, true);
        echo "\" />
<meta property=\"og:url\" content=\"";
        // line 7
        echo url("/");
        echo twig_escape_filter($this->env, $this->sandbox->ensureToStringAllowed(twig_get_attribute($this->env, $this->source, twig_get_attribute($this->env, $this->source, ($context["this"] ?? null), "page", [], "any", false, false, true, 7), "url", [], "any", false, false, true, 7), 7, $this->source), "html", null, true);
        echo "\" />
<meta property=\"og:type\" content=\"website\" />
<meta
  property=\"og:image\"
  content=\"";
        // line 11
        echo url("/");
        echo "/storage/app/media/logoog.jpg\"
/>
<link rel=\"shortcut icon\" href=\"";
        // line 13
        echo url("/");
        echo "/storage/app/media/fav.png\" type=\"icon/png\">
<link rel=\"stylesheet\" href=\"";
        // line 14
        echo $this->extensions['Cms\Twig\Extension']->themeFilter("assets/css/libs/swiper-bundle.min.css");
        echo "\">
<link rel=\"stylesheet\" href=\"";
        // line 15
        echo $this->extensions['Cms\Twig\Extension']->themeFilter("assets/css/libs/fancybox.css");
        echo "\">
";
        // line 17
        echo "<link rel=\"stylesheet\" href=\"";
        echo $this->extensions['Cms\Twig\Extension']->themeFilter([0 => "assets/css/style.scss"]);
        echo "\">";
    }

    public function getTemplateName()
    {
        return "/Applications/MAMP/htdocs/template-october/themes/demo/partials/site/head.htm";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  89 => 17,  85 => 15,  81 => 14,  77 => 13,  72 => 11,  64 => 7,  60 => 6,  56 => 5,  52 => 4,  48 => 3,  44 => 2,  39 => 1,);
    }

    public function getSourceContext()
    {
        return new Source("<title>{{ this.page.meta_title }}</title>
<meta name=\"description\" content=\"{{ this.page.meta_description }}\" />
<meta name=\"title\" content=\"{{ this.page.meta_title }}\" />
<link href=\"{{ this.page.id | page}}\" rel=\"canonical\" />
<meta name=\"og:title\" content=\"{{ this.page.meta_title }}\" />
<meta name=\"og:description\" content=\"{{ this.page.meta_description }}\" />
<meta property=\"og:url\" content=\"{{ url('/') }}{{ this.page.url }}\" />
<meta property=\"og:type\" content=\"website\" />
<meta
  property=\"og:image\"
  content=\"{{ url('/') }}/storage/app/media/logoog.jpg\"
/>
<link rel=\"shortcut icon\" href=\"{{ url('/') }}/storage/app/media/fav.png\" type=\"icon/png\">
<link rel=\"stylesheet\" href=\"{{ 'assets/css/libs/swiper-bundle.min.css'|theme }}\">
<link rel=\"stylesheet\" href=\"{{ 'assets/css/libs/fancybox.css'|theme }}\">
{# <link rel=\"stylesheet\" href=\"{{ 'assets/css/libs/aos.css'|theme }}\"> #}
<link rel=\"stylesheet\" href=\"{{ ['assets/css/style.scss']|theme }}\">", "/Applications/MAMP/htdocs/template-october/themes/demo/partials/site/head.htm", "");
    }
    
    public function checkSecurity()
    {
        static $tags = array();
        static $filters = array("escape" => 1, "page" => 4, "theme" => 14);
        static $functions = array("url" => 7);

        try {
            $this->sandbox->checkSecurity(
                [],
                ['escape', 'page', 'theme'],
                ['url']
            );
        } catch (SecurityError $e) {
            $e->setSourceContext($this->source);

            if ($e instanceof SecurityNotAllowedTagError && isset($tags[$e->getTagName()])) {
                $e->setTemplateLine($tags[$e->getTagName()]);
            } elseif ($e instanceof SecurityNotAllowedFilterError && isset($filters[$e->getFilterName()])) {
                $e->setTemplateLine($filters[$e->getFilterName()]);
            } elseif ($e instanceof SecurityNotAllowedFunctionError && isset($functions[$e->getFunctionName()])) {
                $e->setTemplateLine($functions[$e->getFunctionName()]);
            }

            throw $e;
        }

    }
}
