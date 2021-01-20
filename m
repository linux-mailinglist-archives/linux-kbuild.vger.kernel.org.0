Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1BE2FD41A
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Jan 2021 16:37:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387983AbhATOv4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Jan 2021 09:51:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388155AbhATO1P (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Jan 2021 09:27:15 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F124C061757;
        Wed, 20 Jan 2021 06:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=eZL2gMxFqW5JmLxs/aMOZXrVuNP1Ax3qRaArnq70mEY=; b=CYiR3ePSd8UARzae9ScGs12GVl
        tzmdeVcixPsjpt03VuZhiX1QdjoB64IKiYJIcSn6KdzhgRW8vbsWLdc3Panldi0m8aJhCxUvqLiXP
        tgRA1jRoVlS6eRBLVrjm6gNHCGO/8u+s+Iuw1bsnZsZw3hjYasFb0vG59FpPInG79zP91JSCe+4zd
        8kqyj5EHyUjR78lXDubckFPtZJ0IPBBveRlkBW2UrJcoK9fsXDhAv1WBKEHlmLwgP4v5qlcfk7iGS
        PE8Fcbm2+MBmNNggTJhVx+7OVSg8+ZJuo4c9Te0nTVhc+LG5B6bbWfwbepm40uPrKRmSfyqpJzSLX
        mlMPR0qg==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1l2EQI-00Fmdz-5q; Wed, 20 Jan 2021 14:25:30 +0000
Date:   Wed, 20 Jan 2021 14:25:26 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Will McVicker <willmcvicker@google.com>
Cc:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH v5] modules: introduce the MODULE_SCMVERSION config
Message-ID: <20210120142526.GA3759754@infradead.org>
References: <20210108003035.1930475-1-willmcvicker@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108003035.1930475-1-willmcvicker@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 08, 2021 at 12:30:35AM +0000, Will McVicker wrote:
> For example, we have a CI setup that tests new kernel changes on the
> hikey960 and db845c devices without updating their kernel modules. When
> these tests fail, we need to be able to identify the exact device
> configuration the test was using. By including MODULE_SCMVERSION, we can
> identify the exact kernel and modules' SCM versions for debugging the
> failures.

Sorry, but this still has no business in the upstream kernel as every
change to the kernel is free to just change any API.  That is whatever
you test there is a completely unsupported setup.

More importantly the "scmversion" of a module simply does not matter,
as we only support modules from the kernel tree and it thus must be the
kernel version.
be supported.

You are still trying to sneak out of tree module infrastructure in here
with a bad cover story.  Please stop doing that.
