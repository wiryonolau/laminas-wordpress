<?php

namespace LaminasWordpress;

interface WordpressHooksInterface
{
    public function setApplication($application);
    public function setRoutePrefix($route_prefix = "");
    public function init();
    public function pluginActivation();
    public function pluginDeactivation();
    public function log($debug);
    public function posts($query);
    public function templateInclude($template);
    public function templateRedirect();
    public function registerScript($scope, array $scripts = array());
    public function registerWidgets();
    public function registerAdminNavigation($navigation);
    public function getAdminContent();
}
