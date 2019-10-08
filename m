Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6246CFDE6
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2019 17:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbfJHPlS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 8 Oct 2019 11:41:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:46980 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725966AbfJHPlS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Oct 2019 11:41:18 -0400
Received: from linux-8ccs (ip5f5adbf2.dynamic.kabel-deutschland.de [95.90.219.242])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0D09B2070B;
        Tue,  8 Oct 2019 15:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570549278;
        bh=1AOz1WaJM2kMZGmJ/drNUw2mve3Szc1LQSCLyQ/Qf6o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oIPTPUqv1NOHHn6EsGHV7Ds8fiZ1FseXHYLNbow7yP3XSg1kB8aTnRpPwFD6A+jMc
         dr5Z5udWfLSWdzOtFZtuMNG691ktaXJqShE6OxYK4Cv7ON9JbRAy+rE6i9iHuYxZYN
         uXT4RbkpSdVSY0nsuJlBisaazq2aRx/aUiqimJH4=
Date:   Tue, 8 Oct 2019 17:41:12 +0200
From:   Jessica Yu <jeyu@kernel.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Matthias Maennich <maennich@google.com>,
        Adam Zerella <adam.zerella@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] doc: move namespaces.rst from kbuild/ to core-api/
Message-ID: <20191008154111.GA7466@linux-8ccs>
References: <20191008031009.17364-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20191008031009.17364-1-yamada.masahiro@socionext.com>
X-OS:   Linux linux-8ccs 4.12.14-lp150.12.28-default x86_64
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+++ Masahiro Yamada [08/10/19 12:10 +0900]:
>We discussed a better location for this file, and agreed that
>core-api/ is a good fit. Rename it to symbol-namespaces.rst
>for disambiguation, and also add it to index.rst and MAINTAINERS.
>
>Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Applied, thanks!

Jessica

