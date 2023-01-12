Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0573D6671A5
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jan 2023 13:06:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231337AbjALMGy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 12 Jan 2023 07:06:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232346AbjALMGR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Jan 2023 07:06:17 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48F9F3AA9E;
        Thu, 12 Jan 2023 04:01:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D12DB6201F;
        Thu, 12 Jan 2023 12:01:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 856C5C433EF;
        Thu, 12 Jan 2023 12:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1673524860;
        bh=t/9k2Ihu/gDyXRAWkyMgtoaazFrxY2WxtbZ4chX3GMc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hIIfvtVS0mPLu1p6Wg2SqtuWS+8qck2l3AW4eMrHwpDSofgrNWgtyAnYvZQa083tP
         ea4V0RgLs5l3XXGNcAnJtNj7x/M35pXUoE5Sy51K27JWAxC0OwfwfX2VPlzxPn9xjy
         D0tMb0Vn4431BTZuJ1c+4oaFepN/kKBqOmLrrfG0=
Date:   Thu, 12 Jan 2023 13:00:57 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Tom Saeger <tom.saeger@oracle.com>
Cc:     stable@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 5.15 5.10 5.4 v2] kbuild: fix Build ID if
 CONFIG_MODVERSIONS
Message-ID: <Y7/2ef+JWO6BXGfC@kroah.com>
References: <3df32572ec7016e783d37e185f88495831671f5d.1671143628.git.tom.saeger@oracle.com>
 <Y6M090tsVRIBNlNG@kroah.com>
 <20221221205210.6oolnwkzqo2d6q5h@oracle.com>
 <Y6Pyp+7Udn6x/UVg@kroah.com>
 <20230109183615.zxe7o7fowdpeqlj3@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230109183615.zxe7o7fowdpeqlj3@oracle.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 09, 2023 at 12:36:15PM -0600, Tom Saeger wrote:
> On Thu, Dec 22, 2022 at 07:01:11AM +0100, Greg Kroah-Hartman wrote:
> > On Wed, Dec 21, 2022 at 02:52:10PM -0600, Tom Saeger wrote:
> > > On Wed, Dec 21, 2022 at 05:31:51PM +0100, Greg Kroah-Hartman wrote:
> > > > On Thu, Dec 15, 2022 at 04:18:18PM -0700, Tom Saeger wrote:
> > > > > Backport of:
> > > > > commit 0d362be5b142 ("Makefile: link with -z noexecstack --no-warn-rwx-segments")
> > > > > breaks arm64 Build ID when CONFIG_MODVERSIONS=y for all kernels
> > > > > from: commit e4484a495586 ("Merge tag 'kbuild-fixes-v5.0' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild")
> > > > > until: commit df202b452fe6 ("Merge tag 'kbuild-v5.19' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild")
> > > > > 
> > > > > Linus's tree doesn't have this issue since 0d362be5b142 was merged
> > > > > after df202b452fe6 which included:
> > > > > commit 7b4537199a4a ("kbuild: link symbol CRCs at final link, removing CONFIG_MODULE_REL_CRCS")
> > > > 
> > > > Why can't we add this one instead of a custom change?
> > > 
> > > I quickly abandoned that route - there are too many dependencies.
> > 
> > How many?  Why?  Whenever we add a "this is not upstream" patch, 90% of
> > the time it is incorrect and causes problems (merge issues included.)
> > So please please please let's try to keep in sync with what is in
> > Linus's tree.
> > 
> > thanks,
> > 
> > greg k-h
> 
> Ok - I spent some time on this.
> 
> The haystack I searched:
> 
>   git rev-list --grep="masahiroy/linux-kbuild" v5.15..v5.19-rc1 | while read -r CID ; do git rev-list "${CID}^-" ; done | wc -l
>   182
> 
> I have 54 of those 182 applied to 5.15.85, and this works in my
> limited build testing (x86_64 gcc, arm64 gcc, arm64 clang).
> 
> Specifically:
> 
> 
> cbfc9bf3223f genksyms: adjust the output format to modpost
> e7c9c2630e59 kbuild: stop merging *.symversions
> 1d788aa800c7 kbuild: link symbol CRCs at final link, removing CONFIG_MODULE_REL_CRCS
> 8a01c770955b modpost: extract symbol versions from *.cmd files
> a8ade6b33772 modpost: add sym_find_with_module() helper
> a9639fe6b516 modpost: change the license of EXPORT_SYMBOL to bool type
> 04804878f631 modpost: remove left-over cross_compile declaration
> 3388b8af9698 kbuild: record symbol versions in *.cmd files
> 4ff3946463a0 kbuild: generate a list of objects in vmlinux
> 074617e2ad6a modpost: move *.mod.c generation to write_mod_c_files()
> 81b78cb6e821 modpost: merge add_{intree_flag,retpoline,staging_flag} to add_header
> 9df4f00b53b4 modpost: split new_symbol() to symbol allocation and hash table addition
> 85728bcbc500 modpost: make sym_add_exported() always allocate a new symbol
> 82aa2b4d30af modpost: make multiple export error
> 6cc962f0a175 modpost: dump Module.symvers in the same order of modules.order
> 39db82cea373 modpost: traverse the namespace_list in order
> 45dc7b236dcb modpost: use doubly linked list for dump_lists
> 2a322506403a modpost: traverse unresolved symbols in order
> a85718443348 modpost: add sym_add_unresolved() helper
> 5c44b0f89c82 modpost: traverse modules in order
> a0b68f6655f2 modpost: import include/linux/list.h
> ce9f4d32be4e modpost: change mod->gpl_compatible to bool type
> f9fe36a515ca modpost: use bool type where appropriate
> 46f6334d7055 modpost: move struct namespace_list to modpost.c
> afa24c45af49 modpost: retrieve the module dependency and CRCs in check_exports()
> a8f687dc3ac2 modpost: add a separate error for exported symbols without definition
> f97f0e32b230 modpost: remove stale comment about sym_add_exported()
> 0af2ad9d11c3 modpost: do not write out any file when error occurred
> 09eac5681c02 modpost: use snprintf() instead of sprintf() for safety
> ee07380110f2 kbuild: read *.mod to get objects passed to $(LD) or $(AR)
> 97976e5c6d55 kbuild: make *.mod not depend on *.o
> 0d4368c8da07 kbuild: get rid of duplication in *.mod files
> 55f602f00903 kbuild: split the second line of *.mod into *.usyms
> ea9730eb0788 kbuild: reuse real-search to simplify cmd_mod
> 1eacf71f885a kbuild: make multi_depend work with targets in subdirectory
> 19c2b5b6f769 kbuild: reuse suffix-search to refactor multi_depend
> 75df07a9133d kbuild: refactor cmd_modversions_S
> 53257fbea174 kbuild: refactor cmd_modversions_c
> b6e50682c261 modpost: remove annoying namespace_from_kstrtabns()
> 1002d8f060b0 modpost: remove redundant initializes for static variables
> 921fbb7ab714 modpost: move export_from_secname() call to more relevant place
> f49c0989e01b modpost: remove useless export_from_sec()
> 7a98501a77db kbuild: do not remove empty *.symtypes explicitly
> 500f1b31c16f kbuild: factor out genksyms command from cmd_gensymtypes_{c,S}
> e04fcad29aa3 kallsyms: ignore all local labels prefixed by '.L'
> 9e01f7ef15d2 kbuild: drop $(size_append) from cmd_zstd
> 054133567480 kbuild: do not include include/config/auto.conf from shell scripts
> 34d14831eecb kbuild: stop using config_filename in scripts/Makefile.modsign
> 75155bda5498 kbuild: use more subdir- for visiting subdirectories while cleaning
> 1a3f00cd3be8 kbuild: reuse $(cmd_objtool) for cmd_cc_lto_link_modules
> 47704d10e997 kbuild: detect objtool update without using .SECONDEXPANSION
> 7a89d034ccc6 kbuild: factor out OBJECT_FILES_NON_STANDARD check into a macro
> 3cbbf4b9d188 kbuild: store the objtool command in *.cmd files
> 467f0d0aa6b4 kbuild: rename __objtool_obj and reuse it for cmd_cc_lto_link_modules
> 
> There may be a few more patches post v5.19-rc1 for Fixes.
> I haven't tried minimizing the 54.
> 
> Greg - is 54 too many?

Yes.

How about we just revert the original problem commit here to solve this
mess?  Wouldn't that be easier overall?

thanks,

greg k-h
