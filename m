Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8690B52AB0C
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 May 2022 20:43:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236673AbiEQSnD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 May 2022 14:43:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233429AbiEQSnB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 May 2022 14:43:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E313928987
        for <linux-kbuild@vger.kernel.org>; Tue, 17 May 2022 11:42:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1239061389
        for <linux-kbuild@vger.kernel.org>; Tue, 17 May 2022 18:42:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31246C34100;
        Tue, 17 May 2022 18:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1652812978;
        bh=HnvVB6Z3O5gkPCZtjNQvuPzy6HZNXr75Y7p/6+RcqG0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=14KKEzmcoorQSgSpQ0nGEmqRuigh7yUVN8xcqF3HiEOMCy9zIl3PSWFvxRGSx2pEF
         ljgjN2Ir5LXOhwnN9HAFzb8k3doEhOP/5A97JlvlgKGvJe8fMzutUzEWV7YHKAFpt1
         xmItkCdZyC3mdEG/pUxTTW4Y9JCuNQqDhPdPBrFo=
Date:   Tue, 17 May 2022 11:42:57 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     ALOK JHA <alok08jha@gmail.com>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] Makefile: Globally enable fall-through warning
Message-Id: <20220517114257.f13bf43126c51eebe8bcd7d8@linux-foundation.org>
In-Reply-To: <20220517173534.10878-1-alok08jha@gmail.com>
References: <20220517173534.10878-1-alok08jha@gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-9.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 17 May 2022 23:05:34 +0530 ALOK JHA <alok08jha@gmail.com> wrote:

> From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
> 
> Now that all the fall-through warnings have been addressed in the
> kernel, enable the fall-through warning globally.
> 
> Also, update the deprecated.rst file to include implicit fall-through
> as 'deprecated' so people can be pointed to a single location for
> justification.
> 
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: linux-kbuild@vger.kernel.org
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Since you sent the patch, it should have your signoff as well as
Gustavo's.  Please resend?

