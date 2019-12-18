/**
 * @license Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here.
	// For the complete reference:
	// http://docs.ckeditor.com/#!/api/CKEDITOR.config
	
	// The toolbar groups arrangement, optimized for two toolbar rows.
	config.toolbarGroups = [
		{ name: 'forms' },
		{ name: 'tools' },
		{ name: 'others' },
		'/',
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup','Underline','SpecialChar' ,'Superscript','Subscript'] },
		{ name: 'paragraph',   groups: [ 'list', 'indent', 'blocks', 'align' ] },
		{ name: 'insert' },
		{ name: 'styles' },
		{ name: 'colors' },
//		{ name: 'about' }
	];

	// Remove some buttons, provided by the standard plugins, which we don't
	// need to have in the Standard(s) toolbar.
	//config.removeButtons = 'Underline,Subscript,Superscript,SpecialChar';
	/*去掉图片预览框的文字*/
	config.image_previewText = ' ';
	
	/*开启工具栏“图像”中文件上传功能，后面的url为图片上传要指向的的action或servlet*/
	config.filebrowserImageUploadUrl= "http://localhost/upload.jhtml";
	config.uploadUrl= "http://localhost/upload.jhtml";
	config.extraPlugins = 'jme,imagepaste,uploadimage,codesnippet';
	
};
