Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 668532CF3E8
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Dec 2020 19:22:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727129AbgLDSVn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 4 Dec 2020 13:21:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726602AbgLDSVn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 4 Dec 2020 13:21:43 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 213C6C0613D1
        for <linux-kbuild@vger.kernel.org>; Fri,  4 Dec 2020 10:21:03 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id bj5so3578614plb.4
        for <linux-kbuild@vger.kernel.org>; Fri, 04 Dec 2020 10:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=003NfvjYeu2xkj/6ekYLLomNnI81cDCQ9rUfHMrpfcg=;
        b=BpPlJnrofuC2A1d9V05ZQQ7urHDvX4BF9ncEhYd0o68Zxw55s2IJK+BMb/EGZewdlZ
         QlH4N81QVrjN85L2pSblO8EL+P2DBSdaDIISKJ52FT29Q4G7bL1Pr+06IPQXpSxmMAPD
         7FIUZ9xXSQBJsNV6RLUXRWATqYGch+0ayHzDFyPsPEJwfCX/temxseXmiaw7FQp6f5sz
         g7M0xim5IggGgBhqfJskDGdDg5nQHYsNHLt5xTFA+0d0N4r99KCUOHJh8q9TPHT53W0f
         gDB+g/dw9ZaCjorhOfzoQraioPTTaFLz7erRYrqSfuJmS8547+FkbGhUl5qgATAnkIdu
         OHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=003NfvjYeu2xkj/6ekYLLomNnI81cDCQ9rUfHMrpfcg=;
        b=UAK5+BhKwwp9MWGJcOLVFg59OuiJbFtJ2ZaAeoaN3PUfpDDoRjS9GPAFeFrgVBad7a
         rPaVY40JDAdrXKPYf96wX8VhQtABDrsdMUWVY7qYc66/+L/f2rOL+YuCdxo6vxIJsMKw
         uV7rrE5avEBk7rgg++93NwmaLiPKmhoq9G1Gln/N0uXNJhQMD5YmBk+0vcZI38gNFcAW
         /n0maH8RUjqX/PJQ2Nq6giEBYPnx4aUZ1aqQHDQ0tIf2DhvR5/+CK1H7yh7BFIri2V1p
         ajAQ00b9NWp5iPUprPSZj1M/eO+MDLfp5Z70bkhAMxKBYbtANhenQcAgiJ8JvfnzBOyI
         GfaQ==
X-Gm-Message-State: AOAM533cZjWTbSNaFRXsUePehlFPIbosW8CeHkACsyLEjsQO2ST3h32a
        dyjwiKV2bsIdM3yf0uZA41PEsg==
X-Google-Smtp-Source: ABdhPJw4DiHHbPsEtnV8iHjzJl9EPxfMit99Up0ns0AVOaJf0DX+CGbgMjGDqlWwIq7q3SbrsgOZDg==
X-Received: by 2002:a17:90a:a393:: with SMTP id x19mr5431501pjp.68.1607106062476;
        Fri, 04 Dec 2020 10:21:02 -0800 (PST)
Received: from google.com (h208-100-161-3.bendor.broadband.dynamic.tds.net. [208.100.161.3])
        by smtp.gmail.com with ESMTPSA id v63sm5382794pfb.217.2020.12.04.10.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 10:21:01 -0800 (PST)
Date:   Fri, 4 Dec 2020 10:20:59 -0800
From:   Will McVicker <willmcvicker@google.com>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH v2 0/2] Adds support to capture module's SCM version
Message-ID: <X8p+CylIWycDff8w@google.com>
References: <CAGETcx8unBFUHxM67VdOoaWRENGXYoc4qWq2Oir=2rUyJ7F5nA@mail.gmail.com>
 <20201125010541.309848-1-willmcvicker@google.com>
 <X8mEhIeYeMjZc/+7@google.com>
 <20201204075159.GA29752@infradead.org>
 <X8p8ZK1sXQ2E7hSA@google.com>
 <20201204181808.GA26478@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204181808.GA26478@infradead.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Dec 04, 2020 at 06:18:08PM +0000, Christoph Hellwig wrote:
> On Fri, Dec 04, 2020 at 10:13:56AM -0800, Will McVicker wrote:
> > On Fri, Dec 04, 2020 at 07:51:59AM +0000, Christoph Hellwig wrote:
> > > I think your decription still shows absolutely no benefit for the
> > > kernel, so I'not sure why anyone would want to waste time on this.
> > Hi Christoph,
> > 
> > Did you get a chance to read my earlier responses regarding the uses for
> > in-tree modules?
> > 
> > The biggest benefit for the upstream community is being about to get the SCM
> > version for *any* module (including in-tree modules) in the initramfs via the
> > sysfs node. Currently there is no way to do that and there is no guarantee that
> 
> That assumes the SCM version of a module has any kind of meaning for
> an in-tree module.  Which it doesn't.  If you care about the SCM version
> of an in-tree module the only thing we need is one single global sysfs
> file.
Why doesn't it have meaning? With MODVERSIONS, you are able to update in-tree
kernel modules independently of the kernel. That means you can update as many
in-tree modules as you want which would create many different SCM versions (1
per every module update). Also you can update the kernel independently of the
in-tree modules introducing another SCM version.

--Will
