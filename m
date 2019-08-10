Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D66CF88948
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Aug 2019 09:52:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725773AbfHJHwa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 10 Aug 2019 03:52:30 -0400
Received: from verein.lst.de ([213.95.11.211]:32920 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725763AbfHJHwa (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Aug 2019 03:52:30 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 2BBBB68B02; Sat, 10 Aug 2019 09:52:27 +0200 (CEST)
Date:   Sat, 10 Aug 2019 09:52:26 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: can we use mandatory-y for non-uapi headers?
Message-ID: <20190810075226.GA24085@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro,

what is the reason that the documentation says mandatory-y should only
be used for uapi headers?  If would also be very useful for normal
asm-generic headers where most people use the generic version and we
only have a few overrides.  Two headers that immediately come to mind
are dma-mapping.h, or msi.h.
