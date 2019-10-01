Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D96ADC31DD
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Oct 2019 12:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbfJAK6M (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Oct 2019 06:58:12 -0400
Received: from smtp.domeneshop.no ([194.63.252.55]:60619 "EHLO
        smtp.domeneshop.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbfJAK6L (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Oct 2019 06:58:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=OD/B4iuITOBha9TeXpgkoPm9qIuj9lBSYQ/sNuiU7O0=; b=MDcF3cWagQZbEN1B+InsUhKij2
        N3zZg9zAjHkUCBrBGuytCTVkqLRpcnlsLgTtFsfGW4diDrF6qGUVciAPZouJihn2Frw1rVa244yuj
        xLoFESzg27iwtsoQ603yQh14aBwNWfaIczS8rhXtQF6WSPmzrr/uSJkhValCX3zvta9FKxiK3CKwG
        DOcKogl9BpNp/epm3jeSPcILJVWcUIf+bdiG3n6W3S9PK4DVnERJO5N3cRwwcJGiSrBHZPX0vQpbB
        LyNif+S6DxCPBAXZG2F6TcrSe57hdkNO0HxJQ9y20TWQY0JgBJppO/ar7/eKewposog47VHy+GzNV
        D3bbIM7g==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:52781 helo=[192.168.10.177])
        by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <noralf@tronnes.org>)
        id 1iFFr4-00014j-ST; Tue, 01 Oct 2019 12:58:06 +0200
Subject: Re: [PATCH] drm/tiny: Kconfig: Remove always-y THERMAL dep. from
 TINYDRM_REPAPER
To:     Ulf Magnusson <ulfalizer@gmail.com>, linux-kbuild@vger.kernel.org,
        yamada.masahiro@socionext.com
Cc:     airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
        david@lechnology.com, hdegoede@redhat.com, eric@anholt.net,
        tglx@linutronix.de, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20190927174218.GA32085@huvuddator>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <c3b41a7b-ef3b-7960-13a1-d4b8dd6f15b6@tronnes.org>
Date:   Tue, 1 Oct 2019 12:58:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190927174218.GA32085@huvuddator>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



Den 27.09.2019 19.42, skrev Ulf Magnusson:
> Commit 554b3529fe01 ("thermal/drivers/core: Remove the module Kconfig's
> option") changed the type of THERMAL from tristate to bool, so
> THERMAL || !THERMAL is now always y. Remove the redundant dependency.
> 
> Discovered through Kconfiglib detecting a dependency loop. The C tools
> simplify the expression to y before running dependency loop detection,
> and so don't see it. Changing the type of THERMAL back to tristate makes
> the C tools detect the same loop.
> 
> Not sure if running dep. loop detection after simplification can be
> called a bug. Fixing this nit unbreaks Kconfiglib on the kernel at
> least.
> 
> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
> ---

Thanks, applied to drm-misc-next.

Noralf.
