Return-Path: <linux-kbuild+bounces-20-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C367E98E3
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Nov 2023 10:27:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 246511F20100
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Nov 2023 09:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EE3118E27;
	Mon, 13 Nov 2023 09:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o8ws4oie";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wO5USRou"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1159B18E1F;
	Mon, 13 Nov 2023 09:27:38 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1947410D2;
	Mon, 13 Nov 2023 01:27:36 -0800 (PST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id CE80E218F1;
	Mon, 13 Nov 2023 09:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1699867654; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y9C5aBXGL7JdrMgA5N5vj1s4+UPpgym//WXG2+qsYcU=;
	b=o8ws4oieGvAAyXIc3eS90VaASj1ZXIiyNtHHvAe7/e+N1AUGWMAD3yrFatr+afvEQzbK/T
	U/4QHeFfA5l0BjBQvMYLGDDKZus71aHxlEpqVX/FKrbiFPgBnUfTBYhkXg3DUCVG/COt3G
	42BaqRFQBOMXyxJsQytVrYyAnozfw8U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1699867654;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y9C5aBXGL7JdrMgA5N5vj1s4+UPpgym//WXG2+qsYcU=;
	b=wO5USRouxuZwxokKWZsDs920jC+s9HyiOfsXIkjBOeoRkXxc5h5w1q30D8r9HKuSGNX0dR
	qQfV7omLg8wWlfDw==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 539762C221;
	Mon, 13 Nov 2023 09:27:34 +0000 (UTC)
Date: Mon, 13 Nov 2023 10:27:33 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: linux-modules@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
	Lucas De Marchi <lucas.de.marchi@gmail.com>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Jiri Slaby <jslaby@suse.com>, Jan Engelhardt <jengelh@inai.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH kmod v5 5/5] libkmod, depmod, modprobe: Make directory
 for kernel modules configurable
Message-ID: <20231113092733.GA6241@kitsune.suse.cz>
References: <cover.1689589902.git.msuchanek@suse.de>
 <cover.1689681454.git.msuchanek@suse.de>
 <b878a01f09e250bb24dbaede71cc776217a8f862.1689681454.git.msuchanek@suse.de>
 <e3yow7ih6af2hxzkmjay2oan3jypmo4hda64vxvpfco66ajcew@i3zewn4nbklf>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3yow7ih6af2hxzkmjay2oan3jypmo4hda64vxvpfco66ajcew@i3zewn4nbklf>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Oct 17, 2023 at 12:50:15PM -0500, Lucas De Marchi wrote:
> On Tue, Jul 18, 2023 at 02:01:56PM +0200, Michal Suchanek wrote:
> > Now that modprobe.d is searched under ${prefix}/lib, allow a complete
> > transition to files only under ${prefix} by adding a ${module_directory}
> > configuration. This specifies the directory where to search for kernel
> > modules and should match the location where the kernel/distro installs
> > them.
> > 
> > With this distributions that do not want to ship files in /lib can also
> > move kernel modules to /usr while others can keep them in /lib.
> > 
> > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > ---
> > v4: Make the whole path configurable
> > v5: More verbose commit message
> > ---
> > Makefile.am                          |   3 +-
> > configure.ac                         |   7 ++
> > libkmod/libkmod.c                    |   4 +-
> > man/Makefile.am                      |   1 +
> > man/depmod.d.xml                     |   6 +-
> > man/depmod.xml                       |   4 +-
> > man/modinfo.xml                      |   2 +-
> > man/modprobe.xml                     |   2 +-
> > man/modules.dep.xml                  |   6 +-
> > testsuite/module-playground/Makefile |   2 +-
> > testsuite/setup-rootfs.sh            | 109 +++++++++++++++------------
> > testsuite/test-depmod.c              |  16 ++--
> > testsuite/test-testsuite.c           |   8 +-
> > tools/depmod.c                       |   6 +-
> > tools/kmod.pc.in                     |   1 +
> > tools/modinfo.c                      |   4 +-
> > tools/modprobe.c                     |   4 +-
> > tools/static-nodes.c                 |   6 +-
> > 18 files changed, 107 insertions(+), 84 deletions(-)
> > 
> > diff --git a/Makefile.am b/Makefile.am
> > index 6d0b2decfef3..019aa749fdf1 100644
> > --- a/Makefile.am
> > +++ b/Makefile.am
> > @@ -20,6 +20,7 @@ AM_CPPFLAGS = \
> > 	-I$(top_srcdir) \
> > 	-DSYSCONFDIR=\""$(sysconfdir)"\" \
> > 	-DDISTCONFDIR=\""$(distconfdir)"\" \
> > +	-DMODULE_DIRECTORY=\""$(module_directory)"\" \
> > 	${zlib_CFLAGS}
> > 
> > AM_CFLAGS = $(OUR_CFLAGS)
> > @@ -220,7 +221,7 @@ EXTRA_DIST += testsuite/setup-rootfs.sh
> > MODULE_PLAYGROUND = testsuite/module-playground
> > ROOTFS = testsuite/rootfs
> > ROOTFS_PRISTINE = $(top_srcdir)/testsuite/rootfs-pristine
> > -CREATE_ROOTFS = $(AM_V_GEN) $(top_srcdir)/testsuite/setup-rootfs.sh $(ROOTFS_PRISTINE) $(ROOTFS) $(MODULE_PLAYGROUND) $(top_builddir)/config.h $(sysconfdir)
> > +CREATE_ROOTFS = $(AM_V_GEN) MODULE_DIRECTORY=$(module_directory) $(top_srcdir)/testsuite/setup-rootfs.sh $(ROOTFS_PRISTINE) $(ROOTFS) $(MODULE_PLAYGROUND) $(top_builddir)/config.h $(sysconfdir)
> > 
> > build-module-playground:
> > 	$(AM_V_GEN)if test "$(top_srcdir)" != "$(top_builddir)"; then \
> > diff --git a/configure.ac b/configure.ac
> > index b4584d6cdc67..4051dc9249e2 100644
> > --- a/configure.ac
> > +++ b/configure.ac
> > @@ -91,6 +91,12 @@ AC_ARG_WITH([rootlibdir],
> >         [], [with_rootlibdir=$libdir])
> > AC_SUBST([rootlibdir], [$with_rootlibdir])
> > 
> > +# Ideally this would be $prefix/lib/modules but default to /lib/modules for compatibility with earlier versions
> > +AC_ARG_WITH([module_directory],
> > +        AS_HELP_STRING([--with-module-directory=DIR], [directory in which to look for kernel modules - typically '/lib/modules' or '${prefix}/lib/modules']),
> > +        [], [with_module_directory=/lib/modules])
> > +AC_SUBST([module_directory], [$with_module_directory])
> 
> we will probably have "fun" results if we accept a relative path here.
> 
> > +
> > AC_ARG_WITH([zstd],
> > 	AS_HELP_STRING([--with-zstd], [handle Zstandard-compressed modules @<:@default=disabled@:>@]),
> > 	[], [with_zstd=no])
> > @@ -326,6 +332,7 @@ AC_MSG_RESULT([
> > 	$PACKAGE $VERSION
> > 	=======
> > 
> > +	module_directory:	${module_directory}
> > 	prefix:			${prefix}
> > 	sysconfdir:		${sysconfdir}
> > 	distconfdir:		${distconfdir}
> > diff --git a/libkmod/libkmod.c b/libkmod/libkmod.c
> > index 09e6041461b0..63719e886de8 100644
> > --- a/libkmod/libkmod.c
> > +++ b/libkmod/libkmod.c
> > @@ -209,7 +209,7 @@ static int log_priority(const char *priority)
> > 	return 0;
> > }
> > 
> > -static const char *dirname_default_prefix = "/lib/modules";
> > +static const char *dirname_default_prefix = MODULE_DIRECTORY;
> > 
> > static char *get_kernel_release(const char *dirname)
> > {
> > @@ -231,7 +231,7 @@ static char *get_kernel_release(const char *dirname)
> > /**
> >  * kmod_new:
> >  * @dirname: what to consider as linux module's directory, if NULL
> > - *           defaults to /lib/modules/`uname -r`. If it's relative,
> > + *           defaults to ${module_prefix}/lib/modules/`uname -r`. If it's relative,
> 
> module_prefix?  did you mean to use $MODULE_DIRECTORY/`uname -r`?
> 
> >  *           it's treated as relative to the current working directory.
> >  *           Otherwise, give an absolute dirname.
> >  * @config_paths: ordered array of paths (directories or files) where
> > diff --git a/man/Makefile.am b/man/Makefile.am
> > index 2fea8e46bf2f..f550091a216a 100644
> > --- a/man/Makefile.am
> > +++ b/man/Makefile.am
> > @@ -22,6 +22,7 @@ CLEANFILES = $(dist_man_MANS)
> > 	else \
> > 		sed -e '/@DISTCONFDIR@/d' $< ; \
> > 	fi | \
> > +	sed -e 's|@MODULE_DIRECTORY@|$(module_directory)|g' | \
> > 	$(XSLT) \
> > 		-o $@ \
> > 		--nonet \
> > diff --git a/man/depmod.d.xml b/man/depmod.d.xml
> > index f282a39cc840..b07e6a2bd4fe 100644
> > --- a/man/depmod.d.xml
> > +++ b/man/depmod.d.xml
> > @@ -70,7 +70,7 @@
> >         </term>
> >         <listitem>
> >           <para>
> > -            This allows you to specify the order in which /lib/modules
> > +            This allows you to specify the order in which @MODULE_DIRECTORY@
> >             (or other configured module location) subdirectories will
> >             be processed by <command>depmod</command>. Directories are
> >             listed in order, with the highest priority given to the
> > @@ -101,7 +101,7 @@
> >             <command>depmod</command> command. It is possible to
> >             specify one kernel or all kernels using the * wildcard.
> >             <replaceable>modulesubdirectory</replaceable> is the
> > -            name of the subdirectory under /lib/modules (or other
> > +            name of the subdirectory under @MODULE_DIRECTORY@ (or other
> >             module location) where the target module is installed.
> >           </para>
> >           <para>
> > @@ -110,7 +110,7 @@
> >             specifying the following command: "override kmod * extra".
> >             This will ensure that any matching module name installed
> >             under the <command>extra</command> subdirectory within
> > -            /lib/modules (or other module location) will take priority
> > +            @MODULE_DIRECTORY@ (or other module location) will take priority
> >             over any likenamed module already provided by the kernel.
> >           </para>
> >         </listitem>
> > diff --git a/man/depmod.xml b/man/depmod.xml
> > index 3b0097184fd7..fce2a4a67a89 100644
> > --- a/man/depmod.xml
> > +++ b/man/depmod.xml
> > @@ -80,7 +80,7 @@
> >     </para>
> >     <para> <command>depmod</command> creates a list of module dependencies by
> >       reading each module under
> > -      <filename>/lib/modules/</filename><replaceable>version</replaceable> and
> > +      <filename>@MODULE_DIRECTORY@/</filename><replaceable>version</replaceable> and
> >       determining what symbols it exports and what symbols it needs.  By
> >       default, this list is written to <filename>modules.dep</filename>, and a
> >       binary hashed version named <filename>modules.dep.bin</filename>, in the
> > @@ -141,7 +141,7 @@
> >         <listitem>
> >           <para>
> >             If your modules are not currently in the (normal) directory
> > -            <filename>/lib/modules/</filename><replaceable>version</replaceable>,
> > +            <filename>@MODULE_DIRECTORY@/</filename><replaceable>version</replaceable>,
> >             but in a staging area, you can specify a
> >             <replaceable>basedir</replaceable> which is prepended to the
> >             directory name.  This <replaceable>basedir</replaceable> is
> > diff --git a/man/modinfo.xml b/man/modinfo.xml
> > index 9fe0324a2527..b6c4d6045829 100644
> > --- a/man/modinfo.xml
> > +++ b/man/modinfo.xml
> > @@ -54,7 +54,7 @@
> >       <command>modinfo</command> extracts information from the Linux Kernel
> >       modules given on the command line.  If the module name is not a filename,
> >       then the
> > -      <filename>/lib/modules/</filename><replaceable>version</replaceable>
> > +      <filename>@MODULE_DIRECTORY@/</filename><replaceable>version</replaceable>
> >       directory is searched, as is also done by
> >       <citerefentry><refentrytitle>modprobe</refentrytitle><manvolnum>8</manvolnum></citerefentry>
> >       when loading kernel modules.
> > diff --git a/man/modprobe.xml b/man/modprobe.xml
> > index 91f9e27997cd..4d1fd59c000b 100644
> > --- a/man/modprobe.xml
> > +++ b/man/modprobe.xml
> > @@ -78,7 +78,7 @@
> >       is no difference between _ and - in module names (automatic
> >       underscore conversion is performed).
> >       <command>modprobe</command> looks in the module directory
> > -      <filename>/lib/modules/`uname -r`</filename> for all
> > +      <filename>@MODULE_DIRECTORY@/`uname -r`</filename> for all
> >       the modules and other files, except for the optional
> >       configuration files in the
> >       <filename>/etc/modprobe.d</filename> directory
> > diff --git a/man/modules.dep.xml b/man/modules.dep.xml
> > index ed633694ec9e..8ef6d8b3536e 100644
> > --- a/man/modules.dep.xml
> > +++ b/man/modules.dep.xml
> > @@ -34,8 +34,8 @@
> >   </refnamediv>
> > 
> >   <refsynopsisdiv>
> > -    <para><filename>/lib/modules/modules.dep</filename></para>
> > -    <para><filename>/lib/modules/modules.dep.bin</filename></para>
> > +    <para><filename>@MODULE_DIRECTORY@/modules.dep</filename></para>
> > +    <para><filename>@MODULE_DIRECTORY@/modules.dep.bin</filename></para>
> >   </refsynopsisdiv>
> > 
> >   <refsect1><title>DESCRIPTION</title>
> > @@ -43,7 +43,7 @@
> >       <filename>modules.dep.bin</filename> is a binary file generated by
> >       <command>depmod</command> listing the dependencies for
> >       every module in the directories under
> > -      <filename>/lib/modules/</filename><replaceable>version</replaceable>.
> > +      <filename>@MODULE_DIRECTORY@/</filename><replaceable>version</replaceable>.
> >       It is used by kmod tools such as <command>modprobe</command> and
> >       libkmod.
> >     </para>
> > diff --git a/testsuite/module-playground/Makefile b/testsuite/module-playground/Makefile
> > index e6045b0dd932..a7ab09bea2bf 100644
> > --- a/testsuite/module-playground/Makefile
> > +++ b/testsuite/module-playground/Makefile
> > @@ -47,7 +47,7 @@ endif
> > 
> > else
> > # normal makefile
> > -KDIR ?= /lib/modules/`uname -r`/build
> > +KDIR ?= $(module_prefix)/lib/modules/`uname -r`/build
> > KVER ?= `uname -r`
> > ifeq ($(FAKE_BUILD),)
> >     FAKE_BUILD=0
> > diff --git a/testsuite/setup-rootfs.sh b/testsuite/setup-rootfs.sh
> > index 4440ddcd6b4d..a780f9381b3c 100755
> > --- a/testsuite/setup-rootfs.sh
> > +++ b/testsuite/setup-rootfs.sh
> > @@ -16,6 +16,19 @@ create_rootfs() {
> > 	cp -r "$ROOTFS_PRISTINE" "$ROOTFS"
> > 	find "$ROOTFS" -type d -exec chmod +w {} \;
> > 	find "$ROOTFS" -type f -name .gitignore -exec rm -f {} \;
> > +	if [ "$MODULE_DIRECTORY" != "/lib/modules" ] ; then
> > +		sed -i -e "s|/lib/modules|$MODULE_DIRECTORY|g" $(find "$ROOTFS" -name \*.txt -o -name \*.conf -o -name \*.dep)
> > +		sed -i -e "s|$MODULE_DIRECTORY/external|/lib/modules/external|g" $(find "$ROOTFS" -name \*.txt -o -name \*.conf -o -name \*.dep)
> > +		for i in "$ROOTFS"/*/lib/modules/* "$ROOTFS"/*/*/lib/modules/* ; do
> > +			version="$(basename $i)"
> > +			[ $version != 'external' ] || continue
> > +			mod="$(dirname $i)"
> > +			lib="$(dirname $mod)"
> > +			up="$(dirname $lib)$MODULE_DIRECTORY"
> > +			mkdir -p "$up"
> > +			mv "$i" "$up"
> > +		done
> > +	fi
> > 
> > 	if [ "$SYSCONFDIR" != "/etc" ]; then
> > 		find "$ROOTFS" -type d -name etc -printf "%h\n" | while read -r e; do
> > @@ -32,57 +45,57 @@ feature_enabled() {
> > 
> > declare -A map
> > map=(
> > -    ["test-depmod/search-order-simple/lib/modules/4.4.4/kernel/crypto/"]="mod-simple.ko"
> > -    ["test-depmod/search-order-simple/lib/modules/4.4.4/updates/"]="mod-simple.ko"
> > -    ["test-depmod/search-order-same-prefix/lib/modules/4.4.4/foo/"]="mod-simple.ko"
> > -    ["test-depmod/search-order-same-prefix/lib/modules/4.4.4/foobar/"]="mod-simple.ko"
> > -    ["test-depmod/detect-loop/lib/modules/4.4.4/kernel/mod-loop-a.ko"]="mod-loop-a.ko"
> > -    ["test-depmod/detect-loop/lib/modules/4.4.4/kernel/mod-loop-b.ko"]="mod-loop-b.ko"
> > -    ["test-depmod/detect-loop/lib/modules/4.4.4/kernel/mod-loop-c.ko"]="mod-loop-c.ko"
> > -    ["test-depmod/detect-loop/lib/modules/4.4.4/kernel/mod-loop-d.ko"]="mod-loop-d.ko"
> > -    ["test-depmod/detect-loop/lib/modules/4.4.4/kernel/mod-loop-e.ko"]="mod-loop-e.ko"
> > -    ["test-depmod/detect-loop/lib/modules/4.4.4/kernel/mod-loop-f.ko"]="mod-loop-f.ko"
> > -    ["test-depmod/detect-loop/lib/modules/4.4.4/kernel/mod-loop-g.ko"]="mod-loop-g.ko"
> > -    ["test-depmod/detect-loop/lib/modules/4.4.4/kernel/mod-loop-h.ko"]="mod-loop-h.ko"
> > -    ["test-depmod/detect-loop/lib/modules/4.4.4/kernel/mod-loop-i.ko"]="mod-loop-i.ko"
> > -    ["test-depmod/detect-loop/lib/modules/4.4.4/kernel/mod-loop-j.ko"]="mod-loop-j.ko"
> > -    ["test-depmod/detect-loop/lib/modules/4.4.4/kernel/mod-loop-k.ko"]="mod-loop-k.ko"
> > -    ["test-depmod/search-order-external-first/lib/modules/4.4.4/foo/"]="mod-simple.ko"
> > -    ["test-depmod/search-order-external-first/lib/modules/4.4.4/foobar/"]="mod-simple.ko"
> > +    ["test-depmod/search-order-simple$MODULE_DIRECTORY/4.4.4/kernel/crypto/"]="mod-simple.ko"
> > +    ["test-depmod/search-order-simple$MODULE_DIRECTORY/4.4.4/updates/"]="mod-simple.ko"
> > +    ["test-depmod/search-order-same-prefix$MODULE_DIRECTORY/4.4.4/foo/"]="mod-simple.ko"
> > +    ["test-depmod/search-order-same-prefix$MODULE_DIRECTORY/4.4.4/foobar/"]="mod-simple.ko"
> > +    ["test-depmod/detect-loop$MODULE_DIRECTORY/4.4.4/kernel/mod-loop-a.ko"]="mod-loop-a.ko"
> > +    ["test-depmod/detect-loop$MODULE_DIRECTORY/4.4.4/kernel/mod-loop-b.ko"]="mod-loop-b.ko"
> > +    ["test-depmod/detect-loop$MODULE_DIRECTORY/4.4.4/kernel/mod-loop-c.ko"]="mod-loop-c.ko"
> > +    ["test-depmod/detect-loop$MODULE_DIRECTORY/4.4.4/kernel/mod-loop-d.ko"]="mod-loop-d.ko"
> > +    ["test-depmod/detect-loop$MODULE_DIRECTORY/4.4.4/kernel/mod-loop-e.ko"]="mod-loop-e.ko"
> > +    ["test-depmod/detect-loop$MODULE_DIRECTORY/4.4.4/kernel/mod-loop-f.ko"]="mod-loop-f.ko"
> > +    ["test-depmod/detect-loop$MODULE_DIRECTORY/4.4.4/kernel/mod-loop-g.ko"]="mod-loop-g.ko"
> > +    ["test-depmod/detect-loop$MODULE_DIRECTORY/4.4.4/kernel/mod-loop-h.ko"]="mod-loop-h.ko"
> > +    ["test-depmod/detect-loop$MODULE_DIRECTORY/4.4.4/kernel/mod-loop-i.ko"]="mod-loop-i.ko"
> > +    ["test-depmod/detect-loop$MODULE_DIRECTORY/4.4.4/kernel/mod-loop-j.ko"]="mod-loop-j.ko"
> > +    ["test-depmod/detect-loop$MODULE_DIRECTORY/4.4.4/kernel/mod-loop-k.ko"]="mod-loop-k.ko"
> > +    ["test-depmod/search-order-external-first$MODULE_DIRECTORY/4.4.4/foo/"]="mod-simple.ko"
> > +    ["test-depmod/search-order-external-first$MODULE_DIRECTORY/4.4.4/foobar/"]="mod-simple.ko"
> >     ["test-depmod/search-order-external-first/lib/modules/external/"]="mod-simple.ko"
> 
> why didn't you change it here?
> 
> > -    ["test-depmod/search-order-external-last/lib/modules/4.4.4/foo/"]="mod-simple.ko"
> > -    ["test-depmod/search-order-external-last/lib/modules/4.4.4/foobar/"]="mod-simple.ko"
> > +    ["test-depmod/search-order-external-last$MODULE_DIRECTORY/4.4.4/foo/"]="mod-simple.ko"
> > +    ["test-depmod/search-order-external-last$MODULE_DIRECTORY/4.4.4/foobar/"]="mod-simple.ko"
> >     ["test-depmod/search-order-external-last/lib/modules/external/"]="mod-simple.ko"
> 
> and here...

The path is embedded in binary files:

t grep '/lib/modules' | grep Binary
Binary file testsuite/rootfs-pristine/test-modinfo/external/lib/modules/4.4.4/modules.dep.bin matches
Binary file testsuite/rootfs-pristine/test-modprobe/external/lib/modules/4.4.4/modules.dep.bin matches
Binary file testsuite/rootfs-pristine/test-modprobe/module-from-abspath/lib/modules/4.4.4/modules.dep.bin matches
Binary file testsuite/rootfs-pristine/test-modprobe/module-from-relpath/lib/modules/4.4.4/modules.dep.bin matches

The reason is that path to 'external' modules that are not
in $MODULE_DIRECTORY/$(KERNELRELEASE) is recorded as absolute path.

The way these tests are designed the binary files cannot be changed.

To get the same file the non-'external' modules have to be moved to
match the new location of $MODULE_DIRECTORY which results in the same
path relative to $MODULE_DIRECTORY while the 'external' ones are not
moved getting the same absolute path regardless of $MODULE_DIRECTORY.

Thanks

Michal

