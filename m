Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC949256BCC
	for <lists+linux-kbuild@lfdr.de>; Sun, 30 Aug 2020 06:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725825AbgH3E6J (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 30 Aug 2020 00:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgH3E6J (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 30 Aug 2020 00:58:09 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8AF7C061573;
        Sat, 29 Aug 2020 21:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=/BPdq6fIQHLq5dJzaEQBnkUMV6ogXZamxg3o73GppVw=; b=HB5LoxD2q14vmK6ltL/wSJ7dWJ
        yIXKTle4kwcXYajhslju4hEd53EoiwkCCIHTVZ4rMDaEaRkhyzeNDjm17dUgIT4nDAq0BDjYZiR7j
        2/jURSeXdP4khBUSELGNV5S1VK9Gm6EwF5vEuqOEbI8WP4nXqKayICjrajw5a0DOSFkCsrGgO6M+E
        EQc5Fv1VCdZogtHBbY+BA3qyUTYO/MvO3Lxn/ro/JZRfr5urdNhCOd47Szbg9MRwSZwQEwifd70ID
        avnfUDd5Z7RgrdeAjVnChwpl+qyMZ/RLIpGxeslySdQyx9s+D+7dQSzwbgRWd1iVrlTQBFn9BN7XT
        IzSuQzJQ==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kCFPr-0006mh-8J; Sun, 30 Aug 2020 04:58:07 +0000
Subject: Re: [PATCH 11/11] kconfig: qconf: create QApplication after option
 checks
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
References: <20200829081417.725978-1-masahiroy@kernel.org>
 <20200829081417.725978-11-masahiroy@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ebe9c9f6-a3dc-3dc1-3b36-232b711aece1@infradead.org>
Date:   Sat, 29 Aug 2020 21:58:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200829081417.725978-11-masahiroy@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 8/29/20 1:14 AM, Masahiro Yamada wrote:
> 'scripts/kconfig/qconf -h' just calls usage() and exits, with
> QApplication unused.
> 
> There is no need to construct QApplication so early. Do it after
> the parse stage.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/kconfig/qconf.cc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Tested-by: Randy Dunlap <rdunlap@infradead.org>

thanks.
-- 
~Randy
