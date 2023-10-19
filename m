Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5D8C7CF327
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Oct 2023 10:47:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344919AbjJSIrq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Oct 2023 04:47:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231851AbjJSIrp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Oct 2023 04:47:45 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5779D131;
        Thu, 19 Oct 2023 01:47:43 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-53d9f001b35so13017109a12.2;
        Thu, 19 Oct 2023 01:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697705262; x=1698310062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yzLdLZsv3KpWToPZKdN9/qcoYkbhKAJA1zuy4Nsjj3k=;
        b=j3kAQcEKdG9ETNSpc42DKQ24CvGpvGS+CRDZW04P6OEzLqdVfY/qcRA15Nd8mcTBhC
         MtqgYkAHkbiW1D4wm+43MKcqLFQ0D8e3ri1nZio/Ir9f4efSyr5U9AOew31v7Pmffzx5
         sjdOcSaIRpAblp5zm99UoschkbE6RP8xRBDI1ggwOFfdtv2F1ovrHVcLeupfe2wmK8Y1
         ybPgERQwxp/e77BUOqjWIl8AYQiNK9xe4bf9CDLYollNMqDk69rPCepnsKcIHw87fI1L
         SjlRini0hFj2A3NOVK5z5DlhA8X5v0izAV+bQd16S3nWRwsctmupglUxTx7HR3pCXIcu
         oCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697705262; x=1698310062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzLdLZsv3KpWToPZKdN9/qcoYkbhKAJA1zuy4Nsjj3k=;
        b=X9dSdPhr9f828guU4+hUJC45Utw0gj1Xd3OjovVx0dQ8QbE6MAKchE7dtLZLthKoSa
         47iPOp3r6in/9/urWcklD8QJGoHOB3e0dJIUYikozT/4WzjbM3z4DU6tr44sYikrPrHp
         cCcbWFfzPscYGhScOnUPkzoQKcph3pOg2jY29r2jVv5/SwBle59wcEjcb7KzdMasVOBJ
         pZFGR4wbZ5YydzY+3MThXpRpLSNFWuwb8MlVREmg2Y/lJba5apsbCCIIYWf50BuYKLdo
         tWL5iOzVGlAcVe7z6HtAKSG4pv27qfxQJRHb1zNvxmooIowUHPOjrLbjpgiOnBtIrQoS
         tpug==
X-Gm-Message-State: AOJu0YxMqPZbV9DSjKO3IUGmaOvuuOL8gnnRxi3KJ19JoII0rCnpobo0
        K89uY2dosWZPZLj/JaEtFyc=
X-Google-Smtp-Source: AGHT+IFfVB/qd36PJX41p+g4j/2+te/++EWuAUjTUuh1MzuKNTPNcG6jQSb8UnAVHLOPl2JP7v7GHA==
X-Received: by 2002:a17:907:320d:b0:9bf:70ea:692e with SMTP id xg13-20020a170907320d00b009bf70ea692emr1331892ejb.60.1697705261615;
        Thu, 19 Oct 2023 01:47:41 -0700 (PDT)
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
        by smtp.gmail.com with ESMTPSA id p14-20020a1709060dce00b0099cc3c7ace2sm3092009eji.140.2023.10.19.01.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 01:47:41 -0700 (PDT)
From:   Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date:   Thu, 19 Oct 2023 10:47:38 +0200
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alan Maguire <alan.maguire@oracle.com>,
        Nicolas Schier <n.schier@avm.de>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Alice Ryhl <aliceryhl@google.com>,
        Andreas Hindborg <a.hindborg@samsung.com>,
        Andrii Nakryiko <andrii@kernel.org>,
        Benno Lossin <benno.lossin@proton.me>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Gary Guo <gary@garyguo.net>, Hao Luo <haoluo@google.com>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>,
        Martin KaFai Lau <martin.lau@linux.dev>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>, Song Liu <song@kernel.org>,
        Stanislav Fomichev <sdf@google.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Yonghong Song <yonghong.song@linux.dev>, bpf@vger.kernel.org,
        rust-for-linux@vger.kernel.org
Subject: Re: [bpf-next PATCH v2 2/4] kbuild: avoid too many execution of
 scripts/pahole-flags.sh
Message-ID: <ZTDtKonBQeOAiZ/L@krava>
References: <20231018151950.205265-1-masahiroy@kernel.org>
 <20231018151950.205265-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018151950.205265-2-masahiroy@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 19, 2023 at 12:19:48AM +0900, Masahiro Yamada wrote:
> scripts/pahole-flags.sh is executed so many times.
> 
> You can check how many times it is invoked during the build, as follows:
> 
>   $ cat <<EOF >> scripts/pahole-flags.sh
>   > echo "scripts/pahole-flags.sh was executed" >&2
>   > EOF
> 
>   $ make -s
>   scripts/pahole-flags.sh was executed
>   scripts/pahole-flags.sh was executed
>   scripts/pahole-flags.sh was executed
>   scripts/pahole-flags.sh was executed
>   scripts/pahole-flags.sh was executed
>     [ lots of repeated lines suppressed... ]
> 
> This scripts is executed more than 20 times during the kernel build
> because PAHOLE_FLAGS is a recursively expanded variable and exported
> to sub-processes.
> 
> With the GNU Make >= 4.4, it is executed more than 60 times because
> exported variables are also passed to other $(shell ) invocations.
> Without careful coding, it is known to cause an exponential fork
> explosion. [1]
> 
> The use of $(shell ) in an exported recursive variable is likely wrong
> because $(shell ) is always evaluated due to the 'export' keyword, and
> the evaluation can occur multiple times by the nature of recursive
> variables.
> 
> Convert the shell script to a Makefile, which is included only when
> CONFIG_DEBUG_INFO_BTF=y.
> 
> [1]: https://savannah.gnu.org/bugs/index.php?64746
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
> Tested-by: Alan Maguire <alan.maguire@oracle.com>
> Reviewed-by: Nicolas Schier <n.schier@avm.de>
> Tested-by: Miguel Ojeda <ojeda@kernel.org>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>

nice!

Acked-by: Jiri Olsa <jolsa@kernel.org>

thanks,
jirka


> ---
> 
> Changes in v2:
>  - Fix a typo in commit description
>  - Update MAINTAINERS
> 
>  MAINTAINERS             |  2 +-
>  Makefile                |  4 +---
>  scripts/Makefile.btf    | 19 +++++++++++++++++++
>  scripts/pahole-flags.sh | 30 ------------------------------
>  4 files changed, 21 insertions(+), 34 deletions(-)
>  create mode 100644 scripts/Makefile.btf
>  delete mode 100755 scripts/pahole-flags.sh
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 35977b269d5e..a08d558b1aaa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3742,7 +3742,7 @@ F:	net/sched/act_bpf.c
>  F:	net/sched/cls_bpf.c
>  F:	samples/bpf/
>  F:	scripts/bpf_doc.py
> -F:	scripts/pahole-flags.sh
> +F:	scripts/Makefile.btf
>  F:	scripts/pahole-version.sh
>  F:	tools/bpf/
>  F:	tools/lib/bpf/
> diff --git a/Makefile b/Makefile
> index fed9a6cc3665..eaddec67e5e1 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -513,8 +513,6 @@ LZ4		= lz4c
>  XZ		= xz
>  ZSTD		= zstd
>  
> -PAHOLE_FLAGS	= $(shell PAHOLE=$(PAHOLE) $(srctree)/scripts/pahole-flags.sh)
> -
>  CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
>  		  -Wbitwise -Wno-return-void -Wno-unknown-attribute $(CF)
>  NOSTDINC_FLAGS :=
> @@ -605,7 +603,6 @@ export KBUILD_RUSTFLAGS RUSTFLAGS_KERNEL RUSTFLAGS_MODULE
>  export KBUILD_AFLAGS AFLAGS_KERNEL AFLAGS_MODULE
>  export KBUILD_AFLAGS_MODULE KBUILD_CFLAGS_MODULE KBUILD_RUSTFLAGS_MODULE KBUILD_LDFLAGS_MODULE
>  export KBUILD_AFLAGS_KERNEL KBUILD_CFLAGS_KERNEL KBUILD_RUSTFLAGS_KERNEL
> -export PAHOLE_FLAGS
>  
>  # Files to ignore in find ... statements
>  
> @@ -1002,6 +999,7 @@ KBUILD_CPPFLAGS += $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
>  # include additional Makefiles when needed
>  include-y			:= scripts/Makefile.extrawarn
>  include-$(CONFIG_DEBUG_INFO)	+= scripts/Makefile.debug
> +include-$(CONFIG_DEBUG_INFO_BTF)+= scripts/Makefile.btf
>  include-$(CONFIG_KASAN)		+= scripts/Makefile.kasan
>  include-$(CONFIG_KCSAN)		+= scripts/Makefile.kcsan
>  include-$(CONFIG_KMSAN)		+= scripts/Makefile.kmsan
> diff --git a/scripts/Makefile.btf b/scripts/Makefile.btf
> new file mode 100644
> index 000000000000..82377e470aed
> --- /dev/null
> +++ b/scripts/Makefile.btf
> @@ -0,0 +1,19 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +pahole-ver := $(CONFIG_PAHOLE_VERSION)
> +pahole-flags-y :=
> +
> +# pahole 1.18 through 1.21 can't handle zero-sized per-CPU vars
> +ifeq ($(call test-le, $(pahole-ver), 121),y)
> +pahole-flags-$(call test-ge, $(pahole-ver), 118)	+= --skip_encoding_btf_vars
> +endif
> +
> +pahole-flags-$(call test-ge, $(pahole-ver), 121)	+= --btf_gen_floats
> +
> +pahole-flags-$(call test-ge, $(pahole-ver), 122)	+= -j
> +
> +pahole-flags-$(CONFIG_PAHOLE_HAS_LANG_EXCLUDE)		+= --lang_exclude=rust
> +
> +pahole-flags-$(call test-ge, $(pahole-ver), 125)	+= --skip_encoding_btf_inconsistent_proto --btf_gen_optimized
> +
> +export PAHOLE_FLAGS := $(pahole-flags-y)
> diff --git a/scripts/pahole-flags.sh b/scripts/pahole-flags.sh
> deleted file mode 100755
> index 728d55190d97..000000000000
> --- a/scripts/pahole-flags.sh
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -#!/bin/sh
> -# SPDX-License-Identifier: GPL-2.0
> -
> -extra_paholeopt=
> -
> -if ! [ -x "$(command -v ${PAHOLE})" ]; then
> -	exit 0
> -fi
> -
> -pahole_ver=$($(dirname $0)/pahole-version.sh ${PAHOLE})
> -
> -if [ "${pahole_ver}" -ge "118" ] && [ "${pahole_ver}" -le "121" ]; then
> -	# pahole 1.18 through 1.21 can't handle zero-sized per-CPU vars
> -	extra_paholeopt="${extra_paholeopt} --skip_encoding_btf_vars"
> -fi
> -if [ "${pahole_ver}" -ge "121" ]; then
> -	extra_paholeopt="${extra_paholeopt} --btf_gen_floats"
> -fi
> -if [ "${pahole_ver}" -ge "122" ]; then
> -	extra_paholeopt="${extra_paholeopt} -j"
> -fi
> -if [ "${pahole_ver}" -ge "124" ]; then
> -	# see PAHOLE_HAS_LANG_EXCLUDE
> -	extra_paholeopt="${extra_paholeopt} --lang_exclude=rust"
> -fi
> -if [ "${pahole_ver}" -ge "125" ]; then
> -	extra_paholeopt="${extra_paholeopt} --skip_encoding_btf_inconsistent_proto --btf_gen_optimized"
> -fi
> -
> -echo ${extra_paholeopt}
> -- 
> 2.40.1
> 
