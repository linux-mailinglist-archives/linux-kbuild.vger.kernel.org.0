Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1233714DF8D
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Jan 2020 18:01:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727191AbgA3RBu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Jan 2020 12:01:50 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40406 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727224AbgA3RBt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Jan 2020 12:01:49 -0500
Received: by mail-wr1-f65.google.com with SMTP id j104so4984717wrj.7
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Jan 2020 09:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=guwyI7qgekZu8i8afObSu1LIGKaCue9jEjiigz8FV7o=;
        b=cOBH5rPimr2xIplZwH+uFIcSC3HVf/IyQsPBV/6E57BiZZ3lI1PG5HktyBYxWDy74W
         PAxijbtRNyBHzMdIhIApwVSzMmiQCGe44O6xqX2W9nj1D6PzilB8/yrWquPweD0i+aeq
         LEcPJCWmpYryMGqp11YAka6QJQ7iqb09HVMkWuDbyX5IW5edZo2zzlb5dsVtzFj0I+UI
         ZkGeptyaqGyB3a6rZ0Ik1vjthMsJXVcQx6km3eYFiGWMxK4Qoz1IlXolqQ8zST8mxMuG
         7BzIyn/kvUEOZmv6q5KR9pYJFfeqigwfn+7i5aZvM+wEQrwMa1CsQWiSqMIBa3k57haQ
         2Q5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=guwyI7qgekZu8i8afObSu1LIGKaCue9jEjiigz8FV7o=;
        b=pw9oBqqVhXvkEbjPZFDk4kLpSPo5L+QKLQhtk7tZeaOh+TFOXcBdfdPJmXVM5QZivE
         1bTJXleOZbildjHszy92Jj/cdNFspVvBO4YMtFRuR+NopLI9ZyxZWeMxE7CXEzk6bzdc
         ahvkAowLltkXne7JCx8hTGWb42i60ZFtbveoLaALFRPgKWnLUQbEs0ZoJpDZd+67wUyd
         Xui8oPI0lLNFMPDBWHDt84TL15BjbJXJWTjUt+DS5g8P6CWsS6sP/nqcgPrEzlqX1ldO
         jTVSb0CwZhjviHD4gRywfTBteF1hfZUr/YMfAgWtfu69SGHCT0wavxTAxEHeLiexiaoo
         5slQ==
X-Gm-Message-State: APjAAAVhn56Mjae6X2DGKf65Wb33BigybFC8OoY+/z0ITonIt69um86i
        WEWZaX87vI1iP4QcLKQr9cW/hQ==
X-Google-Smtp-Source: APXvYqzWhCWkLPvBVQPtHwccNZiiWYwXr8Q2E99gdO5pqrj0Rft27YWkPuhhXR1trWLNGnB9nNGgYw==
X-Received: by 2002:adf:fac8:: with SMTP id a8mr7069699wrs.81.1580403705987;
        Thu, 30 Jan 2020 09:01:45 -0800 (PST)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
        by smtp.gmail.com with ESMTPSA id s16sm8308922wrn.78.2020.01.30.09.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2020 09:01:44 -0800 (PST)
Date:   Thu, 30 Jan 2020 17:01:41 +0000
From:   Quentin Perret <qperret@google.com>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     masahiroy@kernel.org, nico@fluxnic.net,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        maennich@google.com, kernel-team@android.com
Subject: Re: [PATCH] kbuild: allow symbol whitelisting with TRIM_UNUSED_KSYMS
Message-ID: <20200130170141.GA136787@google.com>
References: <20200129150612.19200-1-qperret@google.com>
 <20200130154530.GA7452@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200130154530.GA7452@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thursday 30 Jan 2020 at 07:45:30 (-0800), Christoph Hellwig wrote:
> On Wed, Jan 29, 2020 at 03:06:12PM +0000, Quentin Perret wrote:
> > CONFIG_TRIM_UNUSED_KSYMS currently removes all unused exported symbols
> > from ksymtab. This works really well when using in-tree drivers, but
> > cannot be used in its current form if some of them are out-of-tree.
> 
> NAK.  The state policy is that we don't care for out of tree modules,
> and this is useful for nothing but.

That is correct. Now, I clearly failed to explain this patch properly,
but the long term goal here _is_ to get vendors to contribute more code
upstream, and have a lot less code downstream / out-of-tree. And I hope
we can agree this would be a good thing. So let me try again, and sorry
if I missed the mark the first time.

As you probably know, the current norm on Android and many other systems
is for vendors to introduce significant changes to their downstream
kernels, and to contribute very little (if any) code back upstream.

One of the goals of the Generic Kernel Image (GKI) project together with
updatability and such is to close the gap between vendor-specific
downstream kernels and upstream. Having one unique kernel for all android
devices of the same architecture regardless of the vendor will
mechanically force all interested parties to agree on a common solution.
And we _are_ pushing for all this to reach upstream and be available to
use by the wider community.

The kernel-to-drivers ABI on Android devices varies significantly from
one vendor kernel to another today (because of changes to exported
symbols, dependencies on vendor symbols, and surely other things). The
first step for GKI is to try and put some order into this by agreeing on
one version of the ABI that works for everybody.

For practical reasons, we need to reduce the ABI surface to a subset of
the exported symbols, simply to make the problem realistically solvable.
Hence this patch.

I understand your point of view, and quite frankly agree with the
message. But I think this patch pushes in the right direction. As I see
it, things like GKI really are significant improvements, so preventing
them from happening by refusing trivial patches such as this one will,
in the long term, do more harm than good to the cause.

Thank you for your time,
Quentin
