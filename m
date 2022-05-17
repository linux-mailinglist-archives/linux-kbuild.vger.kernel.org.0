Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1A4252AC3D
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 May 2022 21:50:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347909AbiEQTuA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 May 2022 15:50:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352867AbiEQTtx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 May 2022 15:49:53 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F675522F9
        for <linux-kbuild@vger.kernel.org>; Tue, 17 May 2022 12:49:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0EF4CB81BE9
        for <linux-kbuild@vger.kernel.org>; Tue, 17 May 2022 19:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CFEDC34100;
        Tue, 17 May 2022 19:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652816986;
        bh=3hQ2YBzbB7PhjHzieG+Z8CkqZgpPQQ7Sx66GkwRs2dk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cpPbQyOUTb2tAJ6v+GG16X+E+0fwdg6FHz3OHReKhQ3MpgedvsIzx35QNOtgOce3H
         DesdcIBDNlBCv43GpCEptSe/Jd4e325+RYaz36kXaCa3cg3eZS3hXh0ztcVn3QKTNF
         xTVReUvg+DOtTWPXKrB/LVYI9CdxWZGzfw4C+XYzhOxOQbfbJfSdPtveaznO637GWi
         M+8LTARz724CoR+FqD5YEIjMX83j0RdEGTG1SZh1MQx+VXZcHPbM2zByEee9lGb8gk
         i9ZP9sLEJSsgdg/YxFOkgaH82svbnEJoxXB7TO0FrLY+QRzs39Q4T61iL4oN1goZkl
         GG3XBTip6yptQ==
Date:   Tue, 17 May 2022 14:59:12 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     ALOK JHA <alok08jha@gmail.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] Makefile: Globally enable fall-through warning
Message-ID: <20220517195912.GA10952@embeddedor>
References: <20220517173534.10878-1-alok08jha@gmail.com>
 <20220517114601.55016e298905d6b6aa0fa873@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517114601.55016e298905d6b6aa0fa873@linux-foundation.org>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, May 17, 2022 at 11:46:01AM -0700, Andrew Morton wrote:
> On Tue, 17 May 2022 23:05:34 +0530 ALOK JHA <alok08jha@gmail.com> wrote:
> 
> > From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
> > 
> > Now that all the fall-through warnings have been addressed in the
> > kernel, enable the fall-through warning globally.
> > 
> > Also, update the deprecated.rst file to include implicit fall-through
> > as 'deprecated' so people can be pointed to a single location for
> > justification.
> > 
> > ...
> >
> > --- a/Documentation/process/deprecated.rst
> > +++ b/Documentation/process/deprecated.rst
> > @@ -119,3 +119,17 @@ array may exceed the remaining memory in the stack segment. This could
> >  lead to a crash, possible overwriting sensitive contents at the end of the
> >  stack (when built without `CONFIG_THREAD_INFO_IN_TASK=y`), or overwriting
> >  memory adjacent to the stack (when built without `CONFIG_VMAP_STACK=y`)
> > +
> > +Implicit switch case fall-through
> > +---------------------------------
> >
> > ...
> >
> 
> Documentation/process/deprecated.rst already has a section "Implicit
> switch case fall-through".  Maybe you're working against an old kernel.
> Please update when resending.

This looks like spam to me.

Let's just ignore this.

--
Gustavo
