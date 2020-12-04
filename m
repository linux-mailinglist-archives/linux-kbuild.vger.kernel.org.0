Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4F82CE8D4
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Dec 2020 08:53:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728152AbgLDHwu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 4 Dec 2020 02:52:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728006AbgLDHwu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 4 Dec 2020 02:52:50 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5C88C061A4F;
        Thu,  3 Dec 2020 23:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=U3za3mThxq3YYOxHiwd5Gzm48LmhZiPsDZQkzmDPyCA=; b=tjKW3HJNjfaWoWPfzh5gg5vkg/
        9QFeqR7kUp3uEEKIqx3S0lAE2bqyS2LdUQkATmGzAE1koDYxoFFArOlb+xosCG+RGKCPAX872w6Db
        JNUYPhs/FMXOtG/YTPDPLMLFTx3SbbbMMcNfpfQF2srrtaLeTTQT2F6QnvJnp5dV9T2Ss1QtGMy4t
        bdhMSLLjs3ztgSJAsXBTzHEe7xkSCRcGbt15+9mrI2LvxljaxIkYUNeViizWfZJSXbHj7qf8uX26A
        nJZSqMb8m+pwMl8s0YcKE3XKE1dOf1caSvZBv5jW3zaLJ7pVoTLjasaHSy1/iRoviAW+KWgeDH44U
        JVKJED5Q==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kl5sm-0007nf-1e; Fri, 04 Dec 2020 07:52:00 +0000
Date:   Fri, 4 Dec 2020 07:51:59 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     William Mcvicker <willmcvicker@google.com>
Cc:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH v2 0/2] Adds support to capture module's SCM version
Message-ID: <20201204075159.GA29752@infradead.org>
References: <CAGETcx8unBFUHxM67VdOoaWRENGXYoc4qWq2Oir=2rUyJ7F5nA@mail.gmail.com>
 <20201125010541.309848-1-willmcvicker@google.com>
 <X8mEhIeYeMjZc/+7@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X8mEhIeYeMjZc/+7@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I think your decription still shows absolutely no benefit for the
kernel, so I'not sure why anyone would want to waste time on this.
