Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E49B759CAF
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Jul 2023 19:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbjGSRqo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 19 Jul 2023 13:46:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjGSRqn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Jul 2023 13:46:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDC4A1BF5
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Jul 2023 10:46:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 55B0B61349
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Jul 2023 17:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C889C433C8;
        Wed, 19 Jul 2023 17:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689788801;
        bh=hPqWGyOsrIQLAabhh1AiKEiBEHaGSbfMtv5rJNNXLk8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cJ+84mOpvs0kEMDp2j4f+iRo9VdUQ3zBhLEsYcnaJ1mARPOMWfqqCYDoyGP3xsC/m
         d9xxGTmjAsqvsolhh6hrBTuNCJ4vnZhWqTY9fhjONN+U1ML0dP0C2qWxf+PMjY2Pqq
         mzbjzFHhU2jBEGYZFyP1Y4qDGiZB50IuqITm4mFaVmsOhflDD3FQT4qD53ENCwv7P7
         7Oqy+fPmkUVjEReQqxOjcxEbaix+3ybiJ+uMBwCZyoqAOxcT6YZC601xWSfmXZAoo5
         e6vXXE7w2dJBLnn500LJy6d0yBBl4nKsXCUiSIox4aowx0hZGbQW/SOIpqUB7W+710
         52khDB5p5/BXg==
Date:   Wed, 19 Jul 2023 10:46:39 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Benjamin Gray <bgray@linux.ibm.com>
Cc:     llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] gen_compile_commands: add assembly files to compilation
 database
Message-ID: <20230719174639.GA1034565@dev-arch.thelio-3990X>
References: <20230719031912.224843-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230719031912.224843-1-bgray@linux.ibm.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 19, 2023 at 01:19:12PM +1000, Benjamin Gray wrote:
> Like C source files, tooling can find it useful to have the assembly
> source file compilation recorded.
> 
> The .S extension appears to used across all architectures.
> 
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> 
> ---
> 
> For example, I'm prototyping adding ASM support to clangd. It can use
> this information to determine the architecture, macros definitions,
> include paths, etc. on a per-file basis. I can capture this during
> compilation with tools like bear, but given this script exists and the

Right, this script was written specifically to avoid relying on external
dependencies to generate a compile_commands file, so modifying this
script is definitely the right thing to allow this to work for anyone
working on the kernel and using the built-in kbuild targets for the
static analyzer and compile_commands.json.

> change is trivial it seems like a good idea to adjust this script too.

Thanks for the patch, this seems reasonable.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  scripts/clang-tools/gen_compile_commands.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
> index 15ba56527acd..a84cc5737c2c 100755
> --- a/scripts/clang-tools/gen_compile_commands.py
> +++ b/scripts/clang-tools/gen_compile_commands.py
> @@ -19,7 +19,7 @@ _DEFAULT_OUTPUT = 'compile_commands.json'
>  _DEFAULT_LOG_LEVEL = 'WARNING'
>  
>  _FILENAME_PATTERN = r'^\..*\.cmd$'
> -_LINE_PATTERN = r'^savedcmd_[^ ]*\.o := (.* )([^ ]*\.c) *(;|$)'
> +_LINE_PATTERN = r'^savedcmd_[^ ]*\.o := (.* )([^ ]*\.[cS]) *(;|$)'
>  _VALID_LOG_LEVELS = ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL']
>  # The tools/ directory adopts a different build system, and produces .cmd
>  # files in a different format. Do not support it.
> -- 
> 2.41.0
> 
> 
