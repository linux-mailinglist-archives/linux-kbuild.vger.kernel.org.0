Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 245826D272
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Jul 2019 19:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727623AbfGRRAZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 18 Jul 2019 13:00:25 -0400
Received: from merlin.infradead.org ([205.233.59.134]:44908 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726040AbfGRRAZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Jul 2019 13:00:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=kQiZc2BE9wRnWMclPA1/QFPclKiqhlGdalRsxoIeIes=; b=R0kiNCZzuWz3Y1/fV4KDs3PDVs
        016j9Tvzhuf7t5FbFkGVLeMQaocJTLFp2zG0WRyRs6xDXsts9VuXGQNOLz641YGXfMK42zIUPAKc+
        uyoXCjLqvEwTSi8o0UtlGtu/QFvIHKkCW89s9rv+15jjvPSWZ/huebb5vKpiCeizTvkxmBpQA8vy0
        rOMRlVvVYCTxDBn30v7sfJH/bS4wZ3ZLjPmKkPaEL1YECqpqVK9pqUXq1AYfzbNkqqAAMzZrI5YHG
        wqOPEVVRbUD0szyTr0x/V6y9If5TBuW8AroCHNLvmw82Q60mPrD1HRPZu6VvICB+rtea8GARhszH9
        Noirag6A==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=[192.168.1.17])
        by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1ho9lX-0005fg-3z; Thu, 18 Jul 2019 17:00:23 +0000
Subject: Re: linux-next: Tree for Jul 18 (header build error)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild <linux-kbuild@vger.kernel.org>
References: <20190718133751.3cf036be@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <127d228c-322d-6349-382b-d304974df148@infradead.org>
Date:   Thu, 18 Jul 2019 10:00:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190718133751.3cf036be@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 7/17/19 8:37 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Please do not add v5.4 material to your linux-next included branches
> until after v5.3-rc1 has been released.
> 
> Changes since 20190717:
> 

on x86_64, when CONFIG_BLOCK is not set:

  CC      include/linux/iomap.h.s
In file included from <command-line>:0:0:
./../include/linux/iomap.h: In function ‘iomap_sector’:
./../include/linux/iomap.h:76:48: error: ‘SECTOR_SHIFT’ undeclared (first use in this function); did you mean ‘SECTIONS_SHIFT’?
  return (iomap->addr + pos - iomap->offset) >> SECTOR_SHIFT;
                                                ^~~~~~~~~~~~


-- 
~Randy
