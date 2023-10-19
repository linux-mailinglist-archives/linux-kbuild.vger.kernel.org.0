Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68DA37CF232
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Oct 2023 10:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232958AbjJSIPt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Oct 2023 04:15:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232788AbjJSIPt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Oct 2023 04:15:49 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C628310F;
        Thu, 19 Oct 2023 01:15:46 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-53da72739c3so12633066a12.3;
        Thu, 19 Oct 2023 01:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697703345; x=1698308145; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ruaMiJuGtsJumTJeYIOfH86pq5ZqFLQfKSz3PZmEz+Q=;
        b=etdowPrmTcFOUMXbeF+imnNOuvWEoGV9pcUggZKcRG94cH/4O2QwAvh22PKA55A1hi
         j4Xo7xiPfm4Kt0WqTiO1Y9RR2BrwaYzfX9JTs1Y1Q9CtRWlhtjTU2wgB1GeoP9/FeUEF
         uP1MpcJ/NlPc4Kf8jUm3i1/U55DhzLz6lPHTKWdczfVzQbRqJQHWxThHrO8ZbUkEPvEv
         bj8C/EnDHQtJWqpKJJP6AfDqoi4WCw1hYGl5sKp8EIyn7p4icYVxZUzwb8RY5RwSkUOs
         LufVCnAeYEAAsgUe3Ix3C+FPt5sAdor5p31BzZuBLYqPrsKO/UGZiiioQnn0vP9YOJll
         2t9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697703345; x=1698308145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ruaMiJuGtsJumTJeYIOfH86pq5ZqFLQfKSz3PZmEz+Q=;
        b=YCYxMCgMSTCt32vwR1W+TdpQs8TK/iyTOJxOn74UV2nFmJFITrornIrvA2CYUyRhAu
         lEtlG+b8RaXDhajUQqPcTRgl5ZBRXPNMeZd/up+e+I+DXLb0nk541/LMBMq85BET644C
         AFaG7RTjKRPZHz1KHjbku9+Fx7mI7/GDBsibbypk/tyBDGn7Hvq5oF9Cq/5kg3hXdSma
         6QPZ9a0+cmZlBq+dQMmeISwvQE5f82+Br7626H4jSn9mMLMcRGrYcyjr7ui8nVcLsrGP
         x9QZ4tzStJ/r1DITADglAI/vb8GOPjSTjqEGunrFYq7tCMIgTA7hKAKHakEjV8RWbjT8
         w7vA==
X-Gm-Message-State: AOJu0YwbuEKIHrIrXUFhKM5mD7FqPuZCvVnlW4T2T9aOU20X+VUY2nBo
        xpCMwQtR4AFPW70f8ZaKR00=
X-Google-Smtp-Source: AGHT+IGZvWEBSs6V9QTW1DOouJsVNWD05agoGBu8+stsov0oNi8/seHGwdiTAKa9ns8s4PssONXfJg==
X-Received: by 2002:a17:907:3e84:b0:9b9:b12c:133d with SMTP id hs4-20020a1709073e8400b009b9b12c133dmr1230168ejc.53.1697703344779;
        Thu, 19 Oct 2023 01:15:44 -0700 (PDT)
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
        by smtp.gmail.com with ESMTPSA id h3-20020a1709063b4300b009b9aa8fffdasm3055677ejf.131.2023.10.19.01.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 01:15:44 -0700 (PDT)
From:   Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date:   Thu, 19 Oct 2023 10:15:42 +0200
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>, bpf@vger.kernel.org
Subject: Re: [bpf-next PATCH v2 4/4] kbuild: refactor module BTF rule
Message-ID: <ZTDlrkTXnkVN1cff@krava>
References: <20231018151950.205265-1-masahiroy@kernel.org>
 <20231018151950.205265-4-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018151950.205265-4-masahiroy@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 19, 2023 at 12:19:50AM +0900, Masahiro Yamada wrote:
> newer_prereqs_except and if_changed_except are ugly hacks of the
> newer-prereqs and if_changed in scripts/Kbuild.include.
> 
> Remove.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
> Changes in v2:
>   - Fix if_changed_except to if_changed
> 
>  scripts/Makefile.modfinal | 25 ++++++-------------------
>  1 file changed, 6 insertions(+), 19 deletions(-)
> 
> diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> index 9fd7a26e4fe9..fc07854bb7b9 100644
> --- a/scripts/Makefile.modfinal
> +++ b/scripts/Makefile.modfinal
> @@ -19,6 +19,9 @@ vmlinux :=
>  ifdef CONFIG_DEBUG_INFO_BTF_MODULES
>  ifneq ($(wildcard vmlinux),)
>  vmlinux := vmlinux
> +cmd_btf = ; \
> +	LLVM_OBJCOPY="$(OBJCOPY)" $(PAHOLE) -J $(PAHOLE_FLAGS) --btf_base vmlinux $@; \
> +	$(RESOLVE_BTFIDS) -b vmlinux $@
>  else
>  $(warning Skipping BTF generation due to unavailability of vmlinux)
>  endif
> @@ -41,27 +44,11 @@ quiet_cmd_ld_ko_o = LD [M]  $@
>        cmd_ld_ko_o +=							\
>  	$(LD) -r $(KBUILD_LDFLAGS)					\
>  		$(KBUILD_LDFLAGS_MODULE) $(LDFLAGS_MODULE)		\
> -		-T scripts/module.lds -o $@ $(filter %.o, $^)
> +		-T scripts/module.lds -o $@ $(filter %.o, $^)		\
> +	$(cmd_btf)
>  
> -quiet_cmd_btf_ko = BTF [M] $@

nit not sure it's intentional but we no longer display 'BTF [M] ...ko' lines,
I don't mind not displaying that, but we should mention that in changelog

jirka

> -      cmd_btf_ko = 							\
> -		LLVM_OBJCOPY="$(OBJCOPY)" $(PAHOLE) -J $(PAHOLE_FLAGS) --btf_base vmlinux $@; \
> -		$(RESOLVE_BTFIDS) -b vmlinux $@
> -
> -# Same as newer-prereqs, but allows to exclude specified extra dependencies
> -newer_prereqs_except = $(filter-out $(PHONY) $(1),$?)
> -
> -# Same as if_changed, but allows to exclude specified extra dependencies
> -if_changed_except = $(if $(call newer_prereqs_except,$(2))$(cmd-check),      \
> -	$(cmd);                                                              \
> -	printf '%s\n' 'savedcmd_$@ := $(make-cmd)' > $(dot-target).cmd, @:)
> -
> -# Re-generate module BTFs if either module's .ko or vmlinux changed
>  %.ko: %.o %.mod.o scripts/module.lds $(vmlinux) FORCE
> -	+$(call if_changed_except,ld_ko_o,vmlinux)
> -ifdef vmlinux
> -	+$(if $(newer-prereqs),$(call cmd,btf_ko))
> -endif
> +	+$(call if_changed,ld_ko_o)
>  
>  targets += $(modules:%.o=%.ko) $(modules:%.o=%.mod.o)
>  
> -- 
> 2.40.1
> 
> 
