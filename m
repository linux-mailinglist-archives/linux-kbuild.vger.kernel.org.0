Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA7CEA493
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2019 21:11:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbfJ3ULi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 30 Oct 2019 16:11:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:53996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726269AbfJ3ULi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 Oct 2019 16:11:38 -0400
Received: from linux-8ccs (unknown [92.117.144.115])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5069720650;
        Wed, 30 Oct 2019 20:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572466296;
        bh=fYNg2uPUmC97M1FRlx78nN1TvRwX0gv7SPs17Dc9Fo8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=m6se2yb5mOsj6qTGDes9L00wnk6VmdMP4fQ48m9LOir2oi/PGfWQGhpuZGGN/SIh7
         D2MXFy3VbBMe18T178UzZ5DGQYBz6YgxmAkjcZ3s1EsUg1lbvI2ydon+BGdvsTyM5X
         A97F0z3ruwtg8BEbz2msc3ZRxDbIzy7OhX0RBzgk=
Date:   Wed, 30 Oct 2019 21:11:28 +0100
From:   Jessica Yu <jeyu@kernel.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthias Maennich <maennich@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] modpost: dump missing namespaces into a single
 modules.nsdeps file
Message-ID: <20191030201127.GC13413@linux-8ccs>
References: <20191029123809.29301-1-yamada.masahiro@socionext.com>
 <20191029123809.29301-3-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20191029123809.29301-3-yamada.masahiro@socionext.com>
X-OS:   Linux linux-8ccs 4.12.14-lp150.12.28-default x86_64
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+++ Masahiro Yamada [29/10/19 21:38 +0900]:
>The modpost, with the -d option given, generates per-module .ns_deps
>files.
>
>Kbuild generates per-module .mod files to carry module information.
>This is convenient because Make handles multiple jobs when the -j
>option is given.
>
>On the other hand, the modpost always runs as a single thread.
>I do not see a strong reason to produce separate .ns_deps files.
>
>This commit changes the modpost to generate just one file,
>modules.nsdeps, each line of which has the following format:
>
>  <module_name>: <list of missing namespaces>
>
>Please note it contains *missing* namespaces instead of required ones.
>So, modules.nsdeps is empty if the namespace dependency is all good.
>
>This will work more efficiently because spatch will no longer process
>already imported namespaces. I removed the '(if needed)' from the
>nsdeps log since spatch is invoked only when needed.

This is a nice optimization! :-)

>This also solved the stale .ns_deps files problem reported by
>Jessica Yu:
>
>  https://lkml.org/lkml/2019/10/28/467

Tested-by: Jessica Yu <jeyu@kernel.org>
Acked-by: Jessica Yu <jeyu@kernel.org>

Thanks for the fix!

>While I was here, I improved the modpost code a little more;
>I freed ns_deps_bus.p because buf_write() allocates memory.
>
>Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>---
>
> .gitignore               |  2 +-
> Documentation/dontdiff   |  1 +
> Makefile                 |  4 ++--
> scripts/Makefile.modpost |  2 +-
> scripts/mod/modpost.c    | 44 +++++++++++++++++-----------------------
> scripts/mod/modpost.h    |  4 ++--
> scripts/nsdeps           | 21 +++++++++----------
> 7 files changed, 36 insertions(+), 42 deletions(-)
>
>diff --git a/.gitignore b/.gitignore
>index 70580bdd352c..72ef86a5570d 100644
>--- a/.gitignore
>+++ b/.gitignore
>@@ -32,7 +32,6 @@
> *.lzo
> *.mod
> *.mod.c
>-*.ns_deps
> *.o
> *.o.*
> *.patch
>@@ -61,6 +60,7 @@ modules.order
> /System.map
> /Module.markers
> /modules.builtin.modinfo
>+/modules.nsdeps
>
> #
> # RPM spec file (make rpm-pkg)
>diff --git a/Documentation/dontdiff b/Documentation/dontdiff
>index 9f4392876099..72fc2e9e2b63 100644
>--- a/Documentation/dontdiff
>+++ b/Documentation/dontdiff
>@@ -179,6 +179,7 @@ mkutf8data
> modpost
> modules.builtin
> modules.builtin.modinfo
>+modules.nsdeps
> modules.order
> modversions.h*
> nconf
>diff --git a/Makefile b/Makefile
>index 0ef897fd9cfd..1e3f307bd49b 100644
>--- a/Makefile
>+++ b/Makefile
>@@ -1356,7 +1356,7 @@ endif # CONFIG_MODULES
>
> # Directories & files removed with 'make clean'
> CLEAN_DIRS  += include/ksym
>-CLEAN_FILES += modules.builtin.modinfo
>+CLEAN_FILES += modules.builtin.modinfo modules.nsdeps
>
> # Directories & files removed with 'make mrproper'
> MRPROPER_DIRS  += include/config include/generated          \
>@@ -1660,7 +1660,7 @@ clean: $(clean-dirs)
> 		-o -name '*.ko.*' \
> 		-o -name '*.dtb' -o -name '*.dtb.S' -o -name '*.dt.yaml' \
> 		-o -name '*.dwo' -o -name '*.lst' \
>-		-o -name '*.su' -o -name '*.mod' -o -name '*.ns_deps' \
>+		-o -name '*.su' -o -name '*.mod' \
> 		-o -name '.*.d' -o -name '.*.tmp' -o -name '*.mod.c' \
> 		-o -name '*.lex.c' -o -name '*.tab.[ch]' \
> 		-o -name '*.asn1.[ch]' \
>diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
>index c9757b20b048..da37128c3f9f 100644
>--- a/scripts/Makefile.modpost
>+++ b/scripts/Makefile.modpost
>@@ -66,7 +66,7 @@ __modpost:
> else
>
> MODPOST += $(subst -i,-n,$(filter -i,$(MAKEFLAGS))) -s -T - \
>-	$(if $(KBUILD_NSDEPS),-d)
>+	$(if $(KBUILD_NSDEPS),-d modules.nsdeps)
>
> ifeq ($(KBUILD_EXTMOD),)
> MODPOST += $(wildcard vmlinux)
>diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
>index dcd90d563ce8..f7425f5d4ab0 100644
>--- a/scripts/mod/modpost.c
>+++ b/scripts/mod/modpost.c
>@@ -38,8 +38,6 @@ static int sec_mismatch_count = 0;
> static int sec_mismatch_fatal = 0;
> /* ignore missing files */
> static int ignore_missing_files;
>-/* write namespace dependencies */
>-static int write_namespace_deps;
>
> enum export {
> 	export_plain,      export_unused,     export_gpl,
>@@ -2217,14 +2215,11 @@ static int check_exports(struct module *mod)
> 		else
> 			basename = mod->name;
>
>-		if (exp->namespace) {
>-			add_namespace(&mod->required_namespaces,
>-				      exp->namespace);
>-
>-			if (!module_imports_namespace(mod, exp->namespace)) {
>-				warn("module %s uses symbol %s from namespace %s, but does not import it.\n",
>-				     basename, exp->name, exp->namespace);
>-			}
>+		if (exp->namespace &&
>+		    !module_imports_namespace(mod, exp->namespace)) {
>+			warn("module %s uses symbol %s from namespace %s, but does not import it.\n",
>+			     basename, exp->name, exp->namespace);
>+			add_namespace(&mod->missing_namespaces, exp->namespace);
> 		}
>
> 		if (!mod->gpl_compatible)
>@@ -2525,29 +2520,27 @@ static void write_dump(const char *fname)
> 	free(buf.p);
> }
>
>-static void write_namespace_deps_files(void)
>+static void write_namespace_deps_files(const char *fname)
> {
> 	struct module *mod;
> 	struct namespace_list *ns;
> 	struct buffer ns_deps_buf = {};
>
> 	for (mod = modules; mod; mod = mod->next) {
>-		char fname[PATH_MAX];
>
>-		if (mod->skip)
>+		if (mod->skip || !mod->missing_namespaces)
> 			continue;
>
>-		ns_deps_buf.pos = 0;
>+		buf_printf(&ns_deps_buf, "%s.ko:", mod->name);
>
>-		for (ns = mod->required_namespaces; ns; ns = ns->next)
>-			buf_printf(&ns_deps_buf, "%s\n", ns->namespace);
>+		for (ns = mod->missing_namespaces; ns; ns = ns->next)
>+			buf_printf(&ns_deps_buf, " %s", ns->namespace);
>
>-		if (ns_deps_buf.pos == 0)
>-			continue;
>-
>-		sprintf(fname, "%s.ns_deps", mod->name);
>-		write_if_changed(&ns_deps_buf, fname);
>+		buf_printf(&ns_deps_buf, "\n");
> 	}
>+
>+	write_if_changed(&ns_deps_buf, fname);
>+	free(ns_deps_buf.p);
> }
>
> struct ext_sym_list {
>@@ -2560,6 +2553,7 @@ int main(int argc, char **argv)
> 	struct module *mod;
> 	struct buffer buf = { };
> 	char *kernel_read = NULL;
>+	char *missing_namespace_deps = NULL;
> 	char *dump_write = NULL, *files_source = NULL;
> 	int opt;
> 	int err;
>@@ -2567,7 +2561,7 @@ int main(int argc, char **argv)
> 	struct ext_sym_list *extsym_iter;
> 	struct ext_sym_list *extsym_start = NULL;
>
>-	while ((opt = getopt(argc, argv, "i:e:mnsT:o:awEd")) != -1) {
>+	while ((opt = getopt(argc, argv, "i:e:mnsT:o:awEd:")) != -1) {
> 		switch (opt) {
> 		case 'i':
> 			kernel_read = optarg;
>@@ -2606,7 +2600,7 @@ int main(int argc, char **argv)
> 			sec_mismatch_fatal = 1;
> 			break;
> 		case 'd':
>-			write_namespace_deps = 1;
>+			missing_namespace_deps = optarg;
> 			break;
> 		default:
> 			exit(1);
>@@ -2654,8 +2648,8 @@ int main(int argc, char **argv)
> 		write_if_changed(&buf, fname);
> 	}
>
>-	if (write_namespace_deps)
>-		write_namespace_deps_files();
>+	if (missing_namespace_deps)
>+		write_namespace_deps_files(missing_namespace_deps);
>
> 	if (dump_write)
> 		write_dump(dump_write);
>diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
>index ad271bc6c313..fe6652535e4b 100644
>--- a/scripts/mod/modpost.h
>+++ b/scripts/mod/modpost.h
>@@ -126,8 +126,8 @@ struct module {
> 	struct buffer dev_table_buf;
> 	char	     srcversion[25];
> 	int is_dot_o;
>-	// Required namespace dependencies
>-	struct namespace_list *required_namespaces;
>+	// Missing namespace dependencies
>+	struct namespace_list *missing_namespaces;
> 	// Actual imported namespaces
> 	struct namespace_list *imported_namespaces;
> };
>diff --git a/scripts/nsdeps b/scripts/nsdeps
>index dda6fbac016e..08db427a7fe5 100644
>--- a/scripts/nsdeps
>+++ b/scripts/nsdeps
>@@ -27,15 +27,14 @@ generate_deps_for_ns() {
> }
>
> generate_deps() {
>-	local mod_name=`basename $@ .ko`
>-	local mod_file=`echo $@ | sed -e 's/\.ko/\.mod/'`
>-	local ns_deps_file=`echo $@ | sed -e 's/\.ko/\.ns_deps/'`
>-	if [ ! -f "$ns_deps_file" ]; then return; fi
>-	local mod_source_files=`cat $mod_file | sed -n 1p                      \
>+	local mod=${1%.ko:}
>+	shift
>+	local namespaces="$*"
>+	local mod_source_files=`cat $mod.mod | sed -n 1p                      \
> 					      | sed -e 's/\.o/\.c/g'           \
> 					      | sed "s|[^ ]* *|${srctree}/&|g"`
>-	for ns in `cat $ns_deps_file`; do
>-		echo "Adding namespace $ns to module $mod_name (if needed)."
>+	for ns in $namespaces; do
>+		echo "Adding namespace $ns to module $mod.ko."
> 		generate_deps_for_ns $ns $mod_source_files
> 		# sort the imports
> 		for source_file in $mod_source_files; do
>@@ -52,7 +51,7 @@ generate_deps() {
> 	done
> }
>
>-for f in `cat $objtree/modules.order`; do
>-	generate_deps $f
>-done
>-
>+while read line
>+do
>+	generate_deps $line
>+done < modules.nsdeps
>-- 
>2.17.1
>
