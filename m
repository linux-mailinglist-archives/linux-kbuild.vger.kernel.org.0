Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE64256BD0
	for <lists+linux-kbuild@lfdr.de>; Sun, 30 Aug 2020 06:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbgH3E7N (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 30 Aug 2020 00:59:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgH3E7M (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 30 Aug 2020 00:59:12 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47FFBC061573;
        Sat, 29 Aug 2020 21:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=IFQRhB40KxQ52UOwTMwmn7LCsdXPtnEkNxQdH+/U8a4=; b=kAUUo9KwGvbiAeRB4+8m4knKEa
        ellI07dvUU4PCe0ZbCWu15lqUZzvrfyXHMOkEN5QQOhrXJWkD07o+hj8T1KUeRiqd4ookMCAG0FAP
        dNghS3s0WEIh7BR5sglSEy4u6TL2E+SAY2zXmSMFCp/A7RCZb9PW8oBWdfPjsdC+KizCS7pKF7LpK
        /YdnmX+NUSEdGluzsa5DplOPE2bZvV2DAJGvcnrAuKfpnItNoTzOUip2SzBsPUv8FRKr6xmmBtVsU
        n2ycBIl0hP2mnoKaWmbBxgg4ZyrJ59Y4vd6BIlpBRI7J/JQ7kRSQ0fYmisL0j6wwC8DIZ73WyobBC
        DUqUwcVg==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kCFQr-0006oo-PF; Sun, 30 Aug 2020 04:59:10 +0000
Subject: Re: [PATCH 01/11] kconfig: qconf: reformat the intro message
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
References: <20200829081417.725978-1-masahiroy@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f7e70754-a624-0e03-9532-097b9fc361e5@infradead.org>
Date:   Sat, 29 Aug 2020 21:59:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200829081417.725978-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 8/29/20 1:14 AM, Masahiro Yamada wrote:
> The introduction message displayed by 'Help -> Introduction' does not
> look nice due to excessive new lines.
> 
> Reformat the message.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/kconfig/qconf.cc | 29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)

Tested-by: Randy Dunlap <rdunlap@infradead.org>

thanks.

-- 
~Randy
