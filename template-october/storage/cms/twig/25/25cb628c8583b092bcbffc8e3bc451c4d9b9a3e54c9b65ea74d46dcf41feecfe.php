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

/* /Applications/MAMP/htdocs/template-october/themes/demo/partials/site/scripts.htm */
class __TwigTemplate_683d7248ce5528668ef4e8b979cdfb41f5a96e8c18a3477c3d6050f28eb1d2c1 extends \Twig\Template
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
        echo "<script src=\"";
        echo $this->extensions['Cms\Twig\Extension']->themeFilter("assets/vendor/jquery.js");
        echo "\"></script>
<script src=\"";
        // line 2
        echo $this->extensions['Cms\Twig\Extension']->themeFilter("assets/vendor/bootstrap.js");
        echo "\"></script>
<script src=\"";
        // line 3
        echo $this->extensions['Cms\Twig\Extension']->themeFilter("assets/js/libs/jquery.maskedinput.js");
        echo "\"></script>
<script src=\"";
        // line 4
        echo $this->extensions['Cms\Twig\Extension']->themeFilter("assets/js/libs/swiper-bundle.min.js");
        echo "\"></script>
<script src=\"";
        // line 5
        echo $this->extensions['Cms\Twig\Extension']->themeFilter("assets/js/libs/fancybox.umd.js");
        echo "\"></script>
";
        // line 7
        echo "<script src=\"";
        echo $this->extensions['Cms\Twig\Extension']->themeFilter([0 => "assets/js/app.js"]);
        echo "\"></script>";
    }

    public function getTemplateName()
    {
        return "/Applications/MAMP/htdocs/template-october/themes/demo/partials/site/scripts.htm";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  60 => 7,  56 => 5,  52 => 4,  48 => 3,  44 => 2,  39 => 1,);
    }

    public function getSourceContext()
    {
        return new Source("<script src=\"{{ 'assets/vendor/jquery.js'|theme }}\"></script>
<script src=\"{{ 'assets/vendor/bootstrap.js'|theme }}\"></script>
<script src=\"{{ 'assets/js/libs/jquery.maskedinput.js'|theme }}\"></script>
<script src=\"{{ 'assets/js/libs/swiper-bundle.min.js'|theme }}\"></script>
<script src=\"{{ 'assets/js/libs/fancybox.umd.js'|theme }}\"></script>
{# <script src=\"{{ 'assets/js/libs/aos.js'|theme }}\"></script> #}
<script src=\"{{ ['assets/js/app.js']|theme }}\"></script>", "/Applications/MAMP/htdocs/template-october/themes/demo/partials/site/scripts.htm", "");
    }
    
    public function checkSecurity()
    {
        static $tags = array();
        static $filters = array("theme" => 1);
        static $functions = array();

        try {
            $this->sandbox->checkSecurity(
                [],
                ['theme'],
                []
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
