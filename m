Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A121A14DE27
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Jan 2020 16:45:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727193AbgA3Ppd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Jan 2020 10:45:33 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:43894 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727186AbgA3Ppd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Jan 2020 10:45:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=rRsa7asAoT2EF7p8LcPXpdUKtc2FvIavKqi2DprRKjs=; b=Vjug28tKKj/KaA/PTpSPmlXiH
        iPzNjTvr8muoqV4hBrVgYWjwe+dXfFgMepmfHSIDUrVE/mORDGA8mJ+Z76fLK7/y+SWvs92/zpO/g
        b7YOwOtKhIs3YJp01JO2bKXYDfmryyvlHqRZ3mROQrDowH7e1EUA9u6bOK7cP3wo2O6VOvNKiJ42g
        oiyXBdzS+/lXYnaXisPF1cCaYi9EyiP+KpYs7cMZm3P9mOm4OBM1fBNYCkk1QasPOUaQEAOyi8lkG
        W9yjHUylopMXmkoaUX+HThjFUz9bTVfF4Rb3bgyavvDbdDAkSN2b789pHXk67MsoS1puar7Liesjc
        OGRPSFMig==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ixC0Y-0000VG-IR; Thu, 30 Jan 2020 15:45:30 +0000
Date:   Thu, 30 Jan 2020 07:45:30 -0800
From:   Christoph Hellwig <hch@infradead.org>
To:     Quentin Perret <qperret@google.com>
Cc:     masahiroy@kernel.org, nico@fluxnic.net,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        maennich@google.com, kernel-team@android.com
Subject: Re: [PATCH] kbuild: allow symbol whitelisting with TRIM_UNUSED_KSYMS
Message-ID: <20200130154530.GA7452@infradead.org>
References: <20200129150612.19200-1-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200129150612.19200-1-qperret@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 29, 2020 at 03:06:12PM +0000, Quentin Perret wrote:
> CONFIG_TRIM_UNUSED_KSYMS currently removes all unused exported symbols
> from ksymtab. This works really well when using in-tree drivers, but
> cannot be used in its current form if some of them are out-of-tree.

NAK.  The state policy is that we don't care for out of tree modules,
and this is useful for nothing but.  In fact we should remove the
CONFIG_TRIM_UNUSED_KSYMS=n option soon.
