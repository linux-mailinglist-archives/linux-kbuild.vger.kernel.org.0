Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7195EA239
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2019 18:02:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727149AbfJ3RCd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 30 Oct 2019 13:02:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:54248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726619AbfJ3RCd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 Oct 2019 13:02:33 -0400
Received: from linux-8ccs (unknown [92.117.144.115])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 751B220650;
        Wed, 30 Oct 2019 17:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572454951;
        bh=aBt9Q8NfOQlfzMtFVoThOg7ZO26NQB6l/hLoSz7abqY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SdIGr98K1FC3u4CQ7m7TiKXLyvBADuk3ieXByyZ6Kf6eFhlf6hylsMdLgW6T/6lVi
         XUA3zJCmag9Gx5GYIaaE7KdZIxNz/RSYTxqxaEdfRfYmOCpGnoVsMUcnRL0QogNfns
         xLbZpQSCw5CV0KZ4TyzObbnNnhDBCs27ytFEbpFc=
Date:   Wed, 30 Oct 2019 18:02:25 +0100
From:   Jessica Yu <jeyu@kernel.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthias Maennich <maennich@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] scripts/nsdeps: support nsdeps for external module
 builds
Message-ID: <20191030170225.GB13413@linux-8ccs>
References: <20191029123809.29301-1-yamada.masahiro@socionext.com>
 <20191029123809.29301-4-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20191029123809.29301-4-yamada.masahiro@socionext.com>
X-OS:   Linux linux-8ccs 4.12.14-lp150.12.28-default x86_64
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+++ Masahiro Yamada [29/10/19 21:38 +0900]:
>Apparently, scripts/nsdeps is written to take care of only in-tree
>modules. Perhaps, this is not a bug, but just a design. At least,
>Documentation/core-api/symbol-namespaces.rst focuses on in-tree modules:
>
>  Again, `make nsdeps` will eventually add the missing namespace imports for
>  in-tree modules::
>  ^^^^^^^
>
>Having said that, I already saw at least two people trying nsdeps for
>external module builds. So, it would be nice to support it.
>
>Reported-by: Steve French <smfrench@gmail.com>
>Reported-by: Jessica Yu <jeyu@kernel.org>
>Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

I can confirm that this fixes nsdeps for external modules for me.

Tested-by: Jessica Yu <jeyu@kernel.org>
Acked-by: Jessica Yu <jeyu@kernel.org>

Thanks!

>---
>
> Documentation/core-api/symbol-namespaces.rst |  3 +++
> Makefile                                     |  1 +
> scripts/Makefile.modpost                     |  2 +-
> scripts/nsdeps                               | 10 ++++++++--
> 4 files changed, 13 insertions(+), 3 deletions(-)
>
>diff --git a/Documentation/core-api/symbol-namespaces.rst b/Documentation/core-api/symbol-namespaces.rst
>index 982ed7b568ac..9b76337f6756 100644
>--- a/Documentation/core-api/symbol-namespaces.rst
>+++ b/Documentation/core-api/symbol-namespaces.rst
>@@ -152,3 +152,6 @@ in-tree modules::
> 	- notice the warning of modpost telling about a missing import
> 	- run `make nsdeps` to add the import to the correct code location
>
>+You can also run nsdeps for external module builds. A typical usage is::
>+
>+	$ make -C <path_to_kernel_src> M=$PWD nsdeps
>diff --git a/Makefile b/Makefile
>index 1e3f307bd49b..780a65493866 100644
>--- a/Makefile
>+++ b/Makefile
>@@ -1007,6 +1007,7 @@ endif
> PHONY += prepare0
>
> export MODORDER := $(extmod-prefix)modules.order
>+export MODULES_NSDEPS := $(extmod-prefix)modules.nsdeps
>
> ifeq ($(KBUILD_EXTMOD),)
> core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
>diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
>index da37128c3f9f..8359f8af5ee6 100644
>--- a/scripts/Makefile.modpost
>+++ b/scripts/Makefile.modpost
>@@ -66,7 +66,7 @@ __modpost:
> else
>
> MODPOST += $(subst -i,-n,$(filter -i,$(MAKEFLAGS))) -s -T - \
>-	$(if $(KBUILD_NSDEPS),-d modules.nsdeps)
>+	$(if $(KBUILD_NSDEPS),-d $(MODULES_NSDEPS))
>
> ifeq ($(KBUILD_EXTMOD),)
> MODPOST += $(wildcard vmlinux)
>diff --git a/scripts/nsdeps b/scripts/nsdeps
>index 08db427a7fe5..3b8a9e173ebf 100644
>--- a/scripts/nsdeps
>+++ b/scripts/nsdeps
>@@ -21,6 +21,12 @@ if [ "$SPATCH_VERSION_NUM" -lt "$SPATCH_REQ_VERSION_NUM" ] ; then
> 	exit 1
> fi
>
>+if [ "$KBUILD_EXTMOD" ]; then
>+	src_prefix=
>+else
>+	src_prefix=$srctree/
>+fi
>+
> generate_deps_for_ns() {
> 	$SPATCH --very-quiet --in-place --sp-file \
> 		$srctree/scripts/coccinelle/misc/add_namespace.cocci -D ns=$1 $2
>@@ -32,7 +38,7 @@ generate_deps() {
> 	local namespaces="$*"
> 	local mod_source_files=`cat $mod.mod | sed -n 1p                      \
> 					      | sed -e 's/\.o/\.c/g'           \
>-					      | sed "s|[^ ]* *|${srctree}/&|g"`
>+					     | sed "s|[^ ]* *|${src_prefix}&|g"`
> 	for ns in $namespaces; do
> 		echo "Adding namespace $ns to module $mod.ko."
> 		generate_deps_for_ns $ns $mod_source_files
>@@ -54,4 +60,4 @@ generate_deps() {
> while read line
> do
> 	generate_deps $line
>-done < modules.nsdeps
>+done < $MODULES_NSDEPS
>-- 
>2.17.1
>
