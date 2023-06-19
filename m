Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99004735729
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jun 2023 14:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbjFSMrF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Jun 2023 08:47:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbjFSMrE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Jun 2023 08:47:04 -0400
Received: from mail.avm.de (mail.avm.de [212.42.244.94])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67BFCE0
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Jun 2023 05:47:01 -0700 (PDT)
Received: from mail-auth.avm.de (unknown [IPv6:2001:bf0:244:244::71])
        by mail.avm.de (Postfix) with ESMTPS;
        Mon, 19 Jun 2023 14:46:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
        t=1687178819; bh=/TIiMlB9NBmJYNFk6DBpgAJTD1HIJoL07VNTZ6u6LFY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=slaf4TPL/1NwpF3rp+MJpKyxVa3fZVi9uMRRE7tq0WQ9rhtorhMtSox8MYL7CCdJv
         3Oe/s3kMTf+MkuwfianvqgT2CLejKt4sGFh+wK1YngeaDj5a8d0e1UxgZq5duC0bqv
         1Bm88IQvmHy3RTWg+MFlAgGYP2nxL4wwL95oy+VI=
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
        by mail-auth.avm.de (Postfix) with ESMTPA id 8532681FD7;
        Mon, 19 Jun 2023 14:46:59 +0200 (CEST)
Received: by buildd.core.avm.de (Postfix, from userid 1000)
        id 76FBF18207E; Mon, 19 Jun 2023 14:46:59 +0200 (CEST)
Date:   Mon, 19 Jun 2023 14:46:59 +0200
From:   Nicolas Schier <n.schier@avm.de>
To:     Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
Cc:     linux-kbuild@vger.kernel.org, masahiroy@kernel.org, devzero@web.de
Subject: Re: [PATCH v4] script: modpost: emit a warning when the description
 is missing
Message-ID: <ZJBOQy0d+V0qLZns@buildd.core.avm.de>
References: <20230615234037.244446-1-vincenzopalazzodev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230615234037.244446-1-vincenzopalazzodev@gmail.com>
X-purgate-ID: 149429::1687178819-765C30AE-ACBCEB6A/0/0
X-purgate-type: clean
X-purgate-size: 1310
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jun 16, 2023 at 01:40:37AM +0200, Vincenzo Palazzo wrote:
> Emit a warning when the mod description is missed and only
> when the W=1 is enabled.
> 
> Based on top: https://patchwork.kernel.org/project/linux-kbuild/patch/20230606094159.1910369-1-masahiroy@kernel.org/
> 
> Sorry the version 3 is wrong, there is no reason 
> to wrap the if under the `W`.

You probably wanted to put this paragraph below the trailer block
(separated by another '---').

> 
> Reported-by: Roland Kletzing <devzero@web.de>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=10770
> Signed-off-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
> ---

Tested-by: Nicolas Schier <n.schier@avm.de>


>  scripts/mod/modpost.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index d4531d09984d..0cdf8d655bd3 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1818,6 +1818,8 @@ static void read_symbols(const char *modname)
>  		}
>  	}
>  
> +	if (extra_warn && !get_modinfo(&info, "description"))
> +		warn("missing MODULE_DESCRIPTION() in %s\n", modname);
>  	for (sym = info.symtab_start; sym < info.symtab_stop; sym++) {
>  		symname = remove_dot(info.strtab + sym->st_name);
>  
> -- 
> 2.41.0
> 
