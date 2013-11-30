/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/


CKEDITOR.editorConfig = function( config )
{
	config.toolbar_Easy =
	[
	  { name: 'document', items : [ 'Source','Preview' ] },
	  { name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord' ] },
	  { name: 'editing', items : [ 'Find','Replace','SelectAll','RemoveFormat' ] },
	  { name: 'styles', items : [ 'Format','Font','FontSize' ] },
	  { name: 'tools', items : [ 'About' ] },
	  '/',
	  { name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript' ] },
	  { name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv',
	  '-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl' ] },
	  { name: 'links', items : [ 'Link','Unlink','Anchor' ] },
	  { name: 'insert', items : [ 'Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak','Iframe' ] }
  ];
};
