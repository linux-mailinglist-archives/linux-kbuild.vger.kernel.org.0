Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25C6B2C29D5
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Nov 2020 15:40:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389140AbgKXOiT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Nov 2020 09:38:19 -0500
Received: from verein.lst.de ([213.95.11.211]:54764 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388014AbgKXOiT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Nov 2020 09:38:19 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 2E01F6736F; Tue, 24 Nov 2020 15:38:17 +0100 (CET)
Date:   Tue, 24 Nov 2020 15:38:16 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 2/2] uuid: Make guid_t completely internal type to
 the kernel
Message-ID: <20201124143816.GA3294@lst.de>
References: <20201030184950.26732-1-andriy.shevchenko@linux.intel.com> <20201030184950.26732-2-andriy.shevchenko@linux.intel.com> <20201124133945.GA30840@lst.de> <20201124140745.GO4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124140745.GO4077@smile.fi.intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Nov 24, 2020 at 04:07:45PM +0200, Andy Shevchenko wrote:
> > 
> > IMHO we should kill this header entirely and move the definition to
> > <uapi/linux/mei.h> under a new name so that no one picks up the
> > definition by accident.
> 
> I would like to do that in a separate series. Here I don't change the status
> quo about using it, but for moving it will require to touch MEI code.

Maybe just keep a dummy empty uapi/linux/uuid.h if that is so much
of a problem.
