Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40B65EF15C
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Nov 2019 00:45:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729705AbfKDXpv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 4 Nov 2019 18:45:51 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:34646 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729595AbfKDXpv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Nov 2019 18:45:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=f0kuNC1BcvnIIHysOtvlMz681C3FvgaKVZsTSHonIFw=; b=Kac8MnVA/Cr+tQG0SzXvijt4G
        /q+oUdJbTWJpFlYrCk5YpdRY49ruAVxh5NSVZ0qHKfcZaJHhnHdtXOHC4NzXFlvoViMf7KjK2HhAN
        zu6MkF+hKc3WKOAlD3K4hJOU7IEniTALsRpaYsUskiKs867Vi7Hwt/qEY5K+Kwi9pWy3l/OZBm2Kv
        ZsZDhS/GiKyA0E4795G69oKvugQTPaEZvLC9nzIVm//9kIEG6kx5nXuG9EEM4358vlIhaGLe1YHfU
        qonSBraKZjlVpivWgmFA2qLjPJ6axRPfrQo1lgXpA/kILDjXbkLpaDaHfUMlgOuw0IRF+poKaLoev
        T8cz8j63A==;
Received: from [2601:1c0:6280:3f0::4ba1]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iRm2g-0001v6-UQ; Mon, 04 Nov 2019 23:45:50 +0000
Subject: Re: [PATCHv2] kconfig: Add option to get the full help text with
 listnewconfig
To:     Laura Abbott <labbott@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        jcline@redhat.com, dzickus@redhat.com
References: <20191104221008.30078-1-labbott@redhat.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <68557a16-f69e-fa36-4b7a-729fa80f60ca@infradead.org>
Date:   Mon, 4 Nov 2019 15:45:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191104221008.30078-1-labbott@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 11/4/19 2:10 PM, Laura Abbott wrote:
> make listnewconfig will list the individual options that need to be set.
> This is useful but there's no easy way to get the help text associated
> with the options at the same time. Introduce a new targe
> 'make helpnewconfig' which lists the full help text of all the
> new options as well. This makes it easier to automatically generate
> changes that are easy for humans to review. This command also adds
> markers between each option for easier parsing.
> 
> Signed-off-by: Laura Abbott <labbott@redhat.com>
> ---
> v2: Dropped rfc tag, renamed extendedlistnewconfig -> helpnewconfig.
> Added another missing help text.
> ---
>  scripts/kconfig/Makefile |  5 ++++-
>  scripts/kconfig/conf.c   | 13 ++++++++++++-
>  2 files changed, 16 insertions(+), 2 deletions(-)

LGTM.  Thanks for the updates.

Acked-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy

