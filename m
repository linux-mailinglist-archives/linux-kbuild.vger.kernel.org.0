Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A6402C2850
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Nov 2020 14:40:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388462AbgKXNjx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Nov 2020 08:39:53 -0500
Received: from verein.lst.de ([213.95.11.211]:54503 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387693AbgKXNjw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Nov 2020 08:39:52 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id BE3BB68B05; Tue, 24 Nov 2020 14:39:46 +0100 (CET)
Date:   Tue, 24 Nov 2020 14:39:45 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 2/2] uuid: Make guid_t completely internal type to
 the kernel
Message-ID: <20201124133945.GA30840@lst.de>
References: <20201030184950.26732-1-andriy.shevchenko@linux.intel.com> <20201030184950.26732-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201030184950.26732-2-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 30, 2020 at 08:49:50PM +0200, Andy Shevchenko wrote:
> diff --git a/include/uapi/linux/uuid.h b/include/uapi/linux/uuid.h
> index e5a7eecef7c3..c3e175f686f4 100644
> --- a/include/uapi/linux/uuid.h
> +++ b/include/uapi/linux/uuid.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>  /*
> - * UUID/GUID definition
> + * MEI UUID definition
>   *
>   * Copyright (C) 2010, Intel Corp.
>   *	Huang Ying <ying.huang@intel.com>
> @@ -22,21 +22,17 @@
>  
>  typedef struct {
>  	__u8 b[16];
> -} guid_t;
> +} uuid_le;

IMHO we should kill this header entirely and move the definition to
<uapi/linux/mei.h> under a new name so that no one picks up the
definition by accident.
