Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22FDD2C1847
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Nov 2020 23:18:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731860AbgKWWNm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 23 Nov 2020 17:13:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731732AbgKWWNm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Nov 2020 17:13:42 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30DBBC061A4D
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Nov 2020 14:13:42 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id l11so9580178plt.1
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Nov 2020 14:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oYNuHU4bByRHbW04P1rIYsgud3/IFqRbZYnLzDzZeGk=;
        b=qXPT+DFyBceoMCKgzQ4K9krDTGbWS62obotE34ZjBaZKyz2guVj28ejAzO82PJHbJR
         xc5pZCMC4UzLXN8l/mmynG7HfDtKAYh4dhlJCWzIN+HIdt+MzNXMtU3GFMAzJ7KMkUT0
         GNRVe+hd7HbXBM1BLIDcpB8jVpThu9VF4Pz8q56Dmi94TRgLk/dAJcUjef7aDgc/4LGE
         wr5nFtl5XIRNu1Y0I8lMKeFITYhS7poM1SMEJeKWctX5LSlknUeL0iWxhzQBshqr92E+
         q02Sb6MF7NEAL3fR5zUR4xOJ6O9lOYDeEAlQztbT610E/Hj1x7JcqqxE0ZpqWV4P2vo9
         CCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oYNuHU4bByRHbW04P1rIYsgud3/IFqRbZYnLzDzZeGk=;
        b=Gs115TixW1AOmU5y24OxhKZJdJD1fRQKooZNEam3trjosPDOLhDrzqMsYQc8Buh6+h
         ow0UK9JW+AMYJHsqYvER3wfw9NfFJXHI0YpnwkROnfh0vPZU+Jiez64y+sgVbkC+eNmM
         zGBPlHQiTdJ6UaJHehhH5+CMKuQEMcdR4eragQLOVkFqaoFK+u5cEFp97D3yrXWfqQmg
         KAdtopgukj6O/2tGMj3vPBOhom4VTz76jjxU9xp/Fiw23vc7urG+mpRA1U7+bmZ+ZOqh
         bIMod2joygmuMAFyC9fGYxnHsDWx2hYZcAHlE3/JTOgerkttPtIaFwqE26WRcc2NEnMW
         ehKw==
X-Gm-Message-State: AOAM533DVtxqUqpLIY1ZvIq2LYsxF/asZ5Wh6S1azK1oUhQ59nWW45we
        +kvxLunFip4mkca7/YZUx8ePzA==
X-Google-Smtp-Source: ABdhPJzdu5l0PilNcc7/2e3B22PRzvQ+RLYtM6PZhFXez7qtg9olZFFHZ+7mXhQTIpmqpwXQUbwr8Q==
X-Received: by 2002:a17:902:b68a:b029:d8:d387:3d04 with SMTP id c10-20020a170902b68ab02900d8d3873d04mr1243192pls.62.1606169621497;
        Mon, 23 Nov 2020 14:13:41 -0800 (PST)
Received: from google.com (h208-100-161-3.bendor.broadband.dynamic.tds.net. [208.100.161.3])
        by smtp.gmail.com with ESMTPSA id q72sm13002681pfq.62.2020.11.23.14.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 14:13:40 -0800 (PST)
Date:   Mon, 23 Nov 2020 14:13:38 -0800
From:   William Mcvicker <willmcvicker@google.com>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-team@android.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v1 0/2] Add support to capture external module's SCM
 version
Message-ID: <20201123221338.GA2726675@google.com>
References: <20201121011652.2006613-1-willmcvicker@google.com>
 <20201123090257.GB6334@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201123090257.GB6334@infradead.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Nov 23, 2020 at 09:02:57AM +0000, Christoph Hellwig wrote:
> On Sat, Nov 21, 2020 at 01:16:49AM +0000, Will McVicker wrote:
> > These two patches add module support to capture an external module's SCM
> > version as a MODULE_INFO() attribute. This allows users to identity the SCM
> > version of a given kernel module by using the modinfo tool or on the device
> > via sysfs:
> 
> As this obviously is of no use for in-tree modules it falls under the we
> don't add code to support things that are not in tree rule and has no
> business in the kernel.

Hi Christoph,

Ah sorry, I didn't intend this to come across as only for external modules.
That just seemed like the easiest way to explain how the scmversion attribute
can be different from the vermagic. We mainly need this for in-tree kernel
modules since that's where most our drivers are. Let me re-phrase this with
that in mind. Basically, I like to look at this as an improved version of the
existing srcversion module attribute since it allows you to easily identify the
module version with a quick SCM version string check instead of doing a full
checksum on the module source.

For example, we have a setup to test kernel changes on the hikey and db845c
devices without updating the kernel modules. Without this scmversion module
attribute, you can't identify the original module version using `uname
-r`. And for kernel modules in the initramfs, you can't even use modinfo to get
the module vermagic.  With this patch, you are able to get the SCM version for
*all* kernel modules (on disk and in the initramfs) via the sysfs node:
/sys/module/<mod>/scmversion. This also works the other way around when
developers update their kernel modules to fix some bug (like a security
vulnerability) but don't need to update the full kernel.

Regarding the documentation, Greg, thanks for pointing out Documentation/ABI/!
I seached high and low for documentation on the other module sysfs attributes,
but couldn't find anything. I'll update the proper documentation in the v2
patchset.

Thanks,
Will

