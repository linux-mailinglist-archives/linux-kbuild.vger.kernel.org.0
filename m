Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 239CE2CF3BE
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Dec 2020 19:14:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387587AbgLDSOl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 4 Dec 2020 13:14:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387556AbgLDSOk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 4 Dec 2020 13:14:40 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97265C061A4F
        for <linux-kbuild@vger.kernel.org>; Fri,  4 Dec 2020 10:14:00 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id y10so2100207plr.10
        for <linux-kbuild@vger.kernel.org>; Fri, 04 Dec 2020 10:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kqGXK79089Igpi5A56cNttm6UXf51X+FqX4gQrf7XWk=;
        b=wCO/6Lvwmk8upUzjOhryX/gmfrvUQ1tYhDHtArOvGZRgt15t00AfsFwuAZzlfz13fH
         ldpyxqZ9ICcl2aUDlC2QiXNSoXxHS1OvzDaym0iHVzsWY9pHPG0PiVS8X4cUxyedXfHm
         1PZwzrhzGAjfurbGmwV9G6Q9t6CRNUoomGduWfVwgWYeJcwlyNs87y6kvpu+Q5mV6EpJ
         Bt08UWuxSlPxbT+ZvdBwZdPBz4u1p+QuEj/rOYLh3mSVKyJ4I3npyBl5Jz0M+VqXP2jA
         RaifWFTox2bsId1FLm4IVQkz9k3W5UPWm7k+6d5xO/X0m2vvKPDEKFeSZIWSBm1lIUew
         jNOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kqGXK79089Igpi5A56cNttm6UXf51X+FqX4gQrf7XWk=;
        b=qGFGAEGAxhtqf1zB1o/VaJqSeCwYXh1kVriJkf9P8DqlPBm0QW0Mj6XEnZUhjeCaZz
         M3Us46z97Ou0gV2JMx7MR61lbYwRgE/XKRw20aBchfp9dLZ23gDFnwK4dp2vjt8LTOKu
         p+kwIDhq9qR7BKpqckWgUf5fEiq5Fr3xmi8+SNv6nabJCc3Mt0Pg58E8al4zK8/CSppM
         OOD0n+qY2FLJsHFoh2lsTo+sw+Y6No+F7L69xWs6bW5m898lKVlgc8oigVN3mUf3wzk1
         lD05W67kMExgQfxyWwSHpXrJbyDMl53g0jcjtZfy/hAUb2Kx2PiQQIz1hP8qM+wnk8XZ
         rsDA==
X-Gm-Message-State: AOAM532WVqO6TWPUck/nm//EG2VAr+w1GeBKIqW90bw44kQeebd+Lwag
        ygLR0E8j2ddO7bvToT98voJaCg==
X-Google-Smtp-Source: ABdhPJyBMLFBT9JovCw0WWc62g37gI+7/e2jXEiSJ3ZTOSt2NarIdLMfryl8EUJV4NtaVAnxEGnN9w==
X-Received: by 2002:a17:90b:3852:: with SMTP id nl18mr5105143pjb.188.1607105639990;
        Fri, 04 Dec 2020 10:13:59 -0800 (PST)
Received: from google.com (h208-100-161-3.bendor.broadband.dynamic.tds.net. [208.100.161.3])
        by smtp.gmail.com with ESMTPSA id i11sm2732864pjl.53.2020.12.04.10.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 10:13:58 -0800 (PST)
Date:   Fri, 4 Dec 2020 10:13:56 -0800
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
Message-ID: <X8p8ZK1sXQ2E7hSA@google.com>
References: <CAGETcx8unBFUHxM67VdOoaWRENGXYoc4qWq2Oir=2rUyJ7F5nA@mail.gmail.com>
 <20201125010541.309848-1-willmcvicker@google.com>
 <X8mEhIeYeMjZc/+7@google.com>
 <20201204075159.GA29752@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204075159.GA29752@infradead.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Dec 04, 2020 at 07:51:59AM +0000, Christoph Hellwig wrote:
> I think your decription still shows absolutely no benefit for the
> kernel, so I'not sure why anyone would want to waste time on this.
Hi Christoph,

Did you get a chance to read my earlier responses regarding the uses for
in-tree modules?

The biggest benefit for the upstream community is being about to get the SCM
version for *any* module (including in-tree modules) in the initramfs via the
sysfs node. Currently there is no way to do that and there is no guarantee that
those modules in the initramfs were compiled with the running kernel. In fact,
running,

  modinfo -F vermagic MODULENAME

will return an invalid vermagic string if the same module with different
vermagic strings exists in the initramfs and on disk because modinfo only looks
at the module on disk (not in memory).

The second most useful benefit goes hand-in-hand with MODVERSIONS. The purpose
of MODVERSIONS is to create a stable interface that allows one to update the
kernel and kernel modules (including in-tree modules) independently. So when
developers do update their kernels independently (think for security bug
fixes), the `scmversion` attribute guarantees developers that they can still
identify the modules' or kernel's SCM version.

I hope that helps. If not, then please let me know why these reasons "show
absolutely no benefit for the kernel?"

Thanks,
Will
