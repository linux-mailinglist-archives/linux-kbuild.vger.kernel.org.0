Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F40A62A11
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jul 2019 22:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731790AbfGHUCZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 8 Jul 2019 16:02:25 -0400
Received: from ms.lwn.net ([45.79.88.28]:53272 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404790AbfGHUCZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Jul 2019 16:02:25 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id CAAA32EF;
        Mon,  8 Jul 2019 20:02:24 +0000 (UTC)
Date:   Mon, 8 Jul 2019 14:02:23 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Subject: Re: [PATCH v2] kbuild: get rid of misleading $(AS) from documents
Message-ID: <20190708140223.39d15d56@lwn.net>
In-Reply-To: <20190706162508.8529-1-yamada.masahiro@socionext.com>
References: <20190706162508.8529-1-yamada.masahiro@socionext.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun,  7 Jul 2019 01:25:08 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> The assembler files in the kernel are *.S instead of *.s, so they must
> be preprocessed. Since 'as' of GNU binutils is not able to preprocess,
> we always use $(CC) as an assembler driver.
> 
> $(AS) is almost unused in Kbuild. As of writing, there is just one place
> that directly invokes $(AS).
> 
>   $ git grep -e '$(AS)' -e '${AS}' -e '$AS' -e '$(AS:' -e '${AS:' -- :^Documentation
>   drivers/net/wan/Makefile:  AS68K = $(AS)
> 
> The documentation about *_AFLAGS* sounds like the flags were passed
> to $(AS). This is somewhat misleading.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

Would you like me to send this up through the docs tree?

Thanks,

jon
