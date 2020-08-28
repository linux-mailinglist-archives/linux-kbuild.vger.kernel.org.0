Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44BD7255ED3
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Aug 2020 18:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgH1Qeg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 28 Aug 2020 12:34:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726033AbgH1Qeg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Aug 2020 12:34:36 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A35B7C061264
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Aug 2020 09:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=7QMJq3w5hFmy0CguGLJcgJX5Hv7gEzWI6kNsLZfzniY=; b=Vh6Z2Mx8Ml0ac/VqL93OZhTrMY
        KmlIelYncIXBN1AZBWKWcriHbjbyfg2pMi8jAPGRNADrdJZFwMkJ8Nqq2YacWc21ZtU5p0JjZMBmz
        1sgx5cO0SXUEHUZRgJswLZvV+HMEiaI2U9qa5RFteMISnmvDMYtAxtF2LC10dSCaD5amZt3j7yd+S
        x1hmykNEQzpqAjOfLs2V/KmZ9DHMoJ1oEt0akqCvGbO8ruPDAhWu+lPjJjhfoKlHf5VTvR6tQjN2C
        7jIVsJiObOdpWBKEmY9RU5eevfwuqfWyHu8ZE8aBizRGNnC6AR0XdxboD97pBTyQ+wVWwRXx6FFky
        fIX/yZWQ==;
Received: from [2601:1c0:6280:3f0::96df]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kBhKj-0008Au-Aq; Fri, 28 Aug 2020 16:34:33 +0000
To:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: ia64 kbuild warning message
Message-ID: <9c333a75-a851-a055-e879-0967c32e2300@infradead.org>
Date:   Fri, 28 Aug 2020 09:34:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Yamada-san,

I am seeing this on ia64 builds:

../scripts/Makefile.build:68: 'arch/ia64/kernel/palinfo.ko' will not be built even though obj-m is specified.
../scripts/Makefile.build:69: You cannot use subdir-y/m to visit a module Makefile. Use obj-y/m instead.

with CONFIG_IA64_PALINFO=y

Can you explain, please?

thanks.
-- 
~Randy
