Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD2B0F0320
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Nov 2019 17:37:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390204AbfKEQhS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Nov 2019 11:37:18 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39669 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390159AbfKEQhS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Nov 2019 11:37:18 -0500
Received: by mail-wm1-f68.google.com with SMTP id t26so16797250wmi.4
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Nov 2019 08:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9eAWZHysMmpPsT2Fk/e3em8a1xRDVffvs84LpQrPqi8=;
        b=TbC+zWlJZzFOgylqxfBv9VBDLGr1WDy9Xz17fBOjwCGTETw57vtqvxhyD+1THF0ADa
         dhphs1leU3Jg2QCc2b7BgsxZU8muO2T2McW7UXHpYKwaB/aw03dQHO5c+SyhcweFR+O9
         VPIPrEf7mljWURtJyDumIpMbstb3hCYmao1c0b9SrDZ8T86c7uJlphnrME4N1LUvYkSL
         VzmKO/hbjBnDcvfkC2zPfyMhA9T92DZmSgEQLonHi8BDzj5uziUE878Qp0lDmlxB3tWq
         gngZnXwRvwYkfAFpXuTTDd3HAxIXg5gGLTjyFj9Wrtkrbp7BM2dmELaAy8nE7jz2FB2X
         JSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9eAWZHysMmpPsT2Fk/e3em8a1xRDVffvs84LpQrPqi8=;
        b=pVWBTdXSAJEtzxBVCVBXMV/49p1/amduWv7avm6apNa5z2m/E2Nv8HgJtN+K1/mfsk
         owL631tWfI5DHiH78aOl+dNe8ha9sdpvm5UiIWznzI+7knwOG5dsCMi86VOlnBZnNZO1
         3d3XR7RkAUF5auTCY2DCPlUKU1XlWNnMGrZcZnDmWe6QrTul2N/l9g2+l+2Cye3bsrx9
         I2aZBUI8P09ZEMNUZ6tsUkfTbAkkZ80gpvHrm4BFLTeGNEtEDF0Rp2uyZk8lMG4VS3Ar
         YyQpdqIy24MP6/vRf1OGa/T33fttlSO9lLJzHpVVXgRmngS5lsAvo1I5HGwjlgf4ekqV
         fjXA==
X-Gm-Message-State: APjAAAVXPW3Mq+xp6L2CzD1CgUhqeScjzmQ3qF1YdSloJ0930MNb5wv1
        ZRAXDi0o4S+OCqzrnoPXC47QOVEnyQc=
X-Google-Smtp-Source: APXvYqwM5cdx7UrG3LSq/lKZ/xN0P/hNMzxTBLC+4oky5BEG43G9kytQtk9/eVZjU3tDwALbR7LxbA==
X-Received: by 2002:a05:600c:21c9:: with SMTP id x9mr4977277wmj.54.1572971835568;
        Tue, 05 Nov 2019 08:37:15 -0800 (PST)
Received: from google.com ([2a00:79e0:d:210:e8f7:125b:61e9:733d])
        by smtp.gmail.com with ESMTPSA id w17sm21725171wra.34.2019.11.05.08.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 08:37:15 -0800 (PST)
Date:   Tue, 5 Nov 2019 16:37:14 +0000
From:   Matthias Maennich <maennich@google.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org, Jessica Yu <jeyu@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] modpost: do not invoke extra modpost for nsdeps
Message-ID: <20191105163714.GC73159@google.com>
References: <20191029123809.29301-1-yamada.masahiro@socionext.com>
 <20191029123809.29301-2-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20191029123809.29301-2-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Oct 29, 2019 at 09:38:06PM +0900, Masahiro Yamada wrote:
>'make nsdeps' invokes the modpost three times at most; before linking
>vmlinux, before building modules, and finally for generating .ns_deps
>files. Running the modpost again and again is annoying.
>
>The last two can be unified. When the -d option is given, the modpost
>still does the usual job, and in addition, generates .ns_deps files.
>
>Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>---

That is a very nice simplification of `make nsdeps`. Thanks!

Tested-by: Matthias Maennich <maennich@google.com>
Reviewed-by: Matthias Maennich <maennich@google.com>

Cheers,
Matthias

>
> Makefile                 | 5 ++---
> scripts/Makefile.modpost | 8 +++-----
> scripts/mod/modpost.c    | 9 ++-------
> 3 files changed, 7 insertions(+), 15 deletions(-)
>
>diff --git a/Makefile b/Makefile
>index 4f4d8979bfce..0ef897fd9cfd 100644
>--- a/Makefile
>+++ b/Makefile
>@@ -1682,10 +1682,9 @@ tags TAGS cscope gtags: FORCE
> # ---------------------------------------------------------------------------
>
> PHONY += nsdeps
>-
>+nsdeps: export KBUILD_NSDEPS=1
> nsdeps: modules
>-	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost nsdeps
>-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/$@
>+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/nsdeps
>
> # Scripts to check various things for consistency
> # ---------------------------------------------------------------------------
>diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
>index 01c0a992d293..c9757b20b048 100644
>--- a/scripts/Makefile.modpost
>+++ b/scripts/Makefile.modpost
>@@ -53,8 +53,7 @@ MODPOST = scripts/mod/modpost						\
> 	$(if $(KBUILD_EXTMOD),$(addprefix -e ,$(KBUILD_EXTRA_SYMBOLS)))	\
> 	$(if $(KBUILD_EXTMOD),-o $(modulesymfile))			\
> 	$(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)			\
>-	$(if $(KBUILD_MODPOST_WARN),-w)					\
>-	$(if $(filter nsdeps,$(MAKECMDGOALS)),-d)
>+	$(if $(KBUILD_MODPOST_WARN),-w)
>
> ifdef MODPOST_VMLINUX
>
>@@ -66,7 +65,8 @@ __modpost:
>
> else
>
>-MODPOST += $(subst -i,-n,$(filter -i,$(MAKEFLAGS))) -s -T -
>+MODPOST += $(subst -i,-n,$(filter -i,$(MAKEFLAGS))) -s -T - \
>+	$(if $(KBUILD_NSDEPS),-d)
>
> ifeq ($(KBUILD_EXTMOD),)
> MODPOST += $(wildcard vmlinux)
>@@ -97,8 +97,6 @@ ifneq ($(KBUILD_MODPOST_NOFINAL),1)
> 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modfinal
> endif
>
>-nsdeps: __modpost
>-
> endif
>
> .PHONY: $(PHONY)
>diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
>index 26ba97245576..dcd90d563ce8 100644
>--- a/scripts/mod/modpost.c
>+++ b/scripts/mod/modpost.c
>@@ -2221,8 +2221,7 @@ static int check_exports(struct module *mod)
> 			add_namespace(&mod->required_namespaces,
> 				      exp->namespace);
>
>-			if (!write_namespace_deps &&
>-			    !module_imports_namespace(mod, exp->namespace)) {
>+			if (!module_imports_namespace(mod, exp->namespace)) {
> 				warn("module %s uses symbol %s from namespace %s, but does not import it.\n",
> 				     basename, exp->name, exp->namespace);
> 			}
>@@ -2641,8 +2640,6 @@ int main(int argc, char **argv)
>
> 		err |= check_modname_len(mod);
> 		err |= check_exports(mod);
>-		if (write_namespace_deps)
>-			continue;
>
> 		add_header(&buf, mod);
> 		add_intree_flag(&buf, !external_module);
>@@ -2657,10 +2654,8 @@ int main(int argc, char **argv)
> 		write_if_changed(&buf, fname);
> 	}
>
>-	if (write_namespace_deps) {
>+	if (write_namespace_deps)
> 		write_namespace_deps_files();
>-		return 0;
>-	}
>
> 	if (dump_write)
> 		write_dump(dump_write);
>-- 
>2.17.1
>
