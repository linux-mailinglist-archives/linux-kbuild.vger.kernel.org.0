Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD5CB733A57
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Jun 2023 22:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbjFPUEW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Jun 2023 16:04:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbjFPUEW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Jun 2023 16:04:22 -0400
X-Greylist: delayed 600 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 16 Jun 2023 13:04:20 PDT
Received: from hi1smtp01.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB65A2133;
        Fri, 16 Jun 2023 13:04:20 -0700 (PDT)
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
        by hi1smtp01.de.adit-jv.com (Postfix) with ESMTP id 01A155202DB;
        Fri, 16 Jun 2023 21:45:12 +0200 (CEST)
Received: from lxhi-065 (10.72.94.3) by hi2exch02.adit-jv.com (10.72.92.28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.23; Fri, 16 Jun
 2023 21:45:11 +0200
Date:   Fri, 16 Jun 2023 21:45:05 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        <linux-kbuild@vger.kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        <Matthias.Thomae@de.bosch.com>, <yyankovskyi@de.adit-jv.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: fix error in 'make clean' after 'make
 dt_binding_check'
Message-ID: <20230616194505.GA27753@lxhi-065>
References: <20200625170434.635114-1-masahiroy@kernel.org>
 <20200625170434.635114-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200625170434.635114-2-masahiroy@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.72.94.3]
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Dear Yamada-san,
Dear Kbuild experts,

On Fri, Jun 26, 2020 at 02:04:31AM +0900, Masahiro Yamada wrote:
> We are having more and more schema files.
> 
> Commit 8b6b80218b01 ("dt-bindings: Fix command line length limit
> calling dt-mk-schema") fixed the 'Argument list too long' error of
> the schema checks, but the same error happens while cleaning too.
> 
> 'make clean' after 'make dt_binding_check' fails as follows:
> 
>   $ make dt_binding_check
>     [ snip ]
>   $ make clean
>   make[2]: execvp: /bin/sh: Argument list too long
>   make[2]: *** [scripts/Makefile.clean:52: __clean] Error 127
>   make[1]: *** [scripts/Makefile.clean:66: Documentation/devicetree/bindings] Error 2
>   make: *** [Makefile:1763: _clean_Documentation] Error 2
> 
> 'make dt_binding_check' generates so many .example.dts, .dt.yaml files,
> which are passed to the 'rm' command when you run 'make clean'.
> 
> I added a small hack to use the 'find' command to clean up most of the
> build artifacts before they are processed by scripts/Makefile.clean
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Documentation/devicetree/bindings/Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
> index a63898954068..f20d234aec46 100644
> --- a/Documentation/devicetree/bindings/Makefile
> +++ b/Documentation/devicetree/bindings/Makefile
> @@ -53,3 +53,8 @@ $(obj)/processed-schema.yaml: $(DT_SCHEMA_FILES) check_dtschema_version FORCE
>  	$(call if_changed,mk_schema)
>  
>  extra-y += processed-schema.yaml
> +
> +# Hack: avoid 'Argument list too long' error for 'make clean'. Remove most of
> +# build artifacts here before they are processed by scripts/Makefile.clean
> +clean-files = $(shell find $(obj) \( -name '*.example.dts' -o \
> +			-name '*.example.dt.yaml' \) -delete 2>/dev/null)

JFYI, we are running into the "Argument list too long" simply by trying to
clean an out-of-tree module (with lots of artifacts though), as below.
Seems to be happening on vanilla (v6.4-rc6-199-gb73056e9f82ebd) too.
Just in case there are any known hacks (or similar reports), please let us know.

$ make -C /data/linux-src M=my_module clean

make: Entering directory '/data/linux-src'
make -f ./scripts/Makefile.clean obj=my_module
set -e;  echo '  CLEAN   my_module';  rm -rf [~1k filenames / 200k char]
make[1]: /bin/sh: Argument list too long
make[1]: *** [scripts/Makefile.clean:45: __clean] Error 127

-- 
Best regards,
Eugeniu Rosca
