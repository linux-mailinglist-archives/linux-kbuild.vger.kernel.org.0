Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1905F52AB29
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 May 2022 20:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbiEQSqN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 May 2022 14:46:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352370AbiEQSqG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 May 2022 14:46:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E5E5643C
        for <linux-kbuild@vger.kernel.org>; Tue, 17 May 2022 11:46:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8FBA9615AF
        for <linux-kbuild@vger.kernel.org>; Tue, 17 May 2022 18:46:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B468DC385B8;
        Tue, 17 May 2022 18:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1652813162;
        bh=moX25DIR/kkRWj+w6YLaovZ1F51+pgw9W9L2LPyqW+Y=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Iw5CQ/TuC6zEwRT/V078x3SI3Iv6kmdPJ5/odOY/qSUyMZ2rPHu5bEO/Xy5eCMSNY
         mAB1gXqPeFLR6M5zqyVauCYr6W3K7yq5KwmiwXmTepolqen5YB1R872K6ZsS2/Scb5
         o05cNNKPwzfjh/PPxWsd1phw3dD3SeR+1S8TXazQ=
Date:   Tue, 17 May 2022 11:46:01 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     ALOK JHA <alok08jha@gmail.com>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] Makefile: Globally enable fall-through warning
Message-Id: <20220517114601.55016e298905d6b6aa0fa873@linux-foundation.org>
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
> ...
>
> --- a/Documentation/process/deprecated.rst
> +++ b/Documentation/process/deprecated.rst
> @@ -119,3 +119,17 @@ array may exceed the remaining memory in the stack segment. This could
>  lead to a crash, possible overwriting sensitive contents at the end of the
>  stack (when built without `CONFIG_THREAD_INFO_IN_TASK=y`), or overwriting
>  memory adjacent to the stack (when built without `CONFIG_VMAP_STACK=y`)
> +
> +Implicit switch case fall-through
> +---------------------------------
>
> ...
>

Documentation/process/deprecated.rst already has a section "Implicit
switch case fall-through".  Maybe you're working against an old kernel.
Please update when resending.

