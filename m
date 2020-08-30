Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BB5E256BCE
	for <lists+linux-kbuild@lfdr.de>; Sun, 30 Aug 2020 06:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbgH3E6m (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 30 Aug 2020 00:58:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgH3E6m (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 30 Aug 2020 00:58:42 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AE13C061573;
        Sat, 29 Aug 2020 21:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=kaO00JMfnVP8ONgOPdYObP3WmAIp+kx25nwPN1NM6Ac=; b=Rf5qryX37G7DDdlD3Mz4shRhtZ
        zNSTscMG/f0IAPDpE3R/wIDQ6z0Y6o0GZCWowjzwquuUNFtkidqW8JQvymJ2SmokaI9Adu6c3dpAa
        y5i+Nbs1woaGHnuDuABw/kTV1ovbEyvG5PZXLrXbYPL0pgltYkmig9UZ/cAmPE25psYsO4SOEv9pr
        FUoAzsKnXho9QAUQp2piHHFubbxF6QtGIpe6Z00T5l3kCPAZdBNXcaAcvyV7qiAsWIbYkOK+dvWxP
        SNWvJ0jf4EnAi1Qfiez86/YvHE/svuPHvv7Mz5BYwnolsV6XWEjek5yGrEDWOu3wSDWk0eyuGZbYS
        SZn1wVpQ==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kCFQO-0006nv-HX; Sun, 30 Aug 2020 04:58:40 +0000
Subject: Re: [PATCH 02/11] kconfig: qconf: update the intro message to match
 to the current code
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
References: <20200829081417.725978-1-masahiroy@kernel.org>
 <20200829081417.725978-2-masahiroy@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7eb60cff-cd6b-28cf-a0e9-b2f2f01035c7@infradead.org>
Date:   Sat, 29 Aug 2020 21:58:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200829081417.725978-2-masahiroy@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 8/29/20 1:14 AM, Masahiro Yamada wrote:
> I do not think "Although there is no cross reference yet ..." is valid
> any longer.
> 
> The cross reference is supported via hyperlinks enabled by the
> "show Debug Info" option.
> 
> Update the message.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/kconfig/qconf.cc | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Tested-by: Randy Dunlap <rdunlap@infradead.org>


thanks.
-- 
~Randy
