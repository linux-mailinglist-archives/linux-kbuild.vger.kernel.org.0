Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6FC16162D
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Feb 2020 16:30:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728444AbgBQPa3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 Feb 2020 10:30:29 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34858 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbgBQPa2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Feb 2020 10:30:28 -0500
Received: by mail-wm1-f66.google.com with SMTP id b17so18930744wmb.0
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Feb 2020 07:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xLlxKzyyWAgwu5oWmWZ61hqmpwUHLeY8xWAp5SqH8Fk=;
        b=S+zAvmD2yQ1EwqGwVy0jNbBc/JnoNJtkB7V+I0iY30+puKcRQ3ibMXnxTnI79NBIPE
         PLm14M2VSI6EuVv7CGUCMbgYGg9aIm5S7xF4Lk0eegbEUVAsYTCKV9JcR+V+DNmr3cy6
         iwGrFgpx7er8cqaKL7Dt7x7Lhss8M8PtD74WBQV3mV90uZhRfGIesDOTk1PtcEnDZNSp
         zjqAhvujcP5bT+MYRei5SqUF+TopSAO0XMC2CaO08i49zKAcBSiCnfPLGL6wXozD+7hF
         Wp4l4kYz1X4RvhVrO3Im3P5kC7zPp4RNiQV3iODXhVppVxoaxO0VwdWJw1d8wtgM3WSS
         /WiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xLlxKzyyWAgwu5oWmWZ61hqmpwUHLeY8xWAp5SqH8Fk=;
        b=fjebewfEBwEA3K1XugBvNF6mc18R7l/Bzz9kheTnboN184P56x3MhJv5m5ZcBbWvU/
         YfThhp156pwqZKf2tgVGwq3DMev5zou9Rub0KSpUpVeWjRwnvxZ42WSXv1JB/81ulsr4
         Dp2Bo5Vq4XCBjCCWeO1MEANrEHMwSboh7co+L+K73sMXV2h7pKF5XWeEkYUjoGrZLdIP
         EE9eeuiEfoqlj6xK4hPJO5BjJI0DiLfBZTMqtToSlBy5DRfPi3JobsPVa09iOo8eOvs8
         6DWO39wo/GwXl7syAPhYYSIo0HkP3dteENmRoFwvLDmbUjr48N/+hKeAkXNEXQRYAPmZ
         Hm7A==
X-Gm-Message-State: APjAAAUQPGHs0UXbt25qD87va1oAhQIo737OVW5DkTLff5GPNxeJPnlR
        Px93zNDFnWx+/jv30gSYkeruJ/68lLw=
X-Google-Smtp-Source: APXvYqxFsYONLB2eCep9N5wM8fW7Ek2DFoknrAl5SFMesGmI/IiJ1wKNf+3vSFg32VOkzIHYOamlhg==
X-Received: by 2002:a1c:9d07:: with SMTP id g7mr22547282wme.130.1581953427019;
        Mon, 17 Feb 2020 07:30:27 -0800 (PST)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
        by smtp.gmail.com with ESMTPSA id y12sm1436973wrw.88.2020.02.17.07.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 07:30:26 -0800 (PST)
Date:   Mon, 17 Feb 2020 15:30:23 +0000
From:   Quentin Perret <qperret@google.com>
To:     Matthias Maennich <maennich@google.com>
Cc:     masahiroy@kernel.org, nico@fluxnic.net,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-team@android.com, jeyu@kernel.org, hch@infradead.org
Subject: Re: [PATCH v4 1/3] kbuild: allow symbol whitelisting with
 TRIM_UNUSED_KSYMS
Message-ID: <20200217153023.GA71210@google.com>
References: <20200212202140.138092-1-qperret@google.com>
 <20200212202140.138092-2-qperret@google.com>
 <20200217152201.GA48466@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200217152201.GA48466@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Monday 17 Feb 2020 at 15:22:01 (+0000), Matthias Maennich wrote:
> In case the whitelist file can't be found, the error message is
> 
>  cat: path/to/file: file not found
> 
> I wonder whether we can make this error message a bit more specific by
> telling the user that the KSYMS_WHITELIST is missing.

+1, that'd be really useful. I'll check the file existence in v5 (in a
POSIX-compliant way, I promise).

> With the above addressed (and your amend for the absolute path test),
> please feel free to add
> 
> Tested-by: Matthias Maennich <maennich@google.com>
> Reviewed-by: Matthias Maennich <maennich@google.com>

Thanks!
Quentin
