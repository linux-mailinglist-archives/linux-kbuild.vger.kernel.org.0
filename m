Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD1041589B1
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2020 06:41:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727716AbgBKFlt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 11 Feb 2020 00:41:49 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51389 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727045AbgBKFls (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Feb 2020 00:41:48 -0500
Received: by mail-wm1-f68.google.com with SMTP id t23so1867990wmi.1
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Feb 2020 21:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9UK8yCk7FMXMntmDZhQuX49VM4DX5p92KAX3l/ustiY=;
        b=H8vNyXhwBS2DWZmEwPfkyw164EyOQ8GfzYO1h4eS0UeEyPeRFaW3yrp0z/s5H/ZljR
         8t9T+X+MRiYFXp0kFkJzGdWJLUVSgal8LF1T2P45tvvNY8qYiZMqx1ZKg0YIdDLpi2Dh
         a2dN1n/FajoVXT8UgM+6n39OuxDGCxNrG5ZjxmB5QXtIzy6cTOtQN2/rfwdSSnZDe2Le
         Dd8K9w3il1vQICt7JjvOk4tdRHmr04Y2+VXQN1LNwwDARCPuvNfCqIoYXVIV9N2oiSwo
         zty4UCsjc9hdwLI8kCnWqyj29PlhqZnr0fLcIs14nlypza9TD91AnKK6tA1CUfznbfSN
         XMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9UK8yCk7FMXMntmDZhQuX49VM4DX5p92KAX3l/ustiY=;
        b=QRC21KVdVNnSDHOuCVq/F+7qs9fjjFIQPb7/D0IWRY2Dp8xf2eNwL1kPB0QQ0D2Mki
         ZmxW2AqE7FgV2WRju9Hk34TpIoGfIxhegJDb0JXJbbwU5Nl3/W3aUyFxRW49YDzFD2np
         7mEfMx627e8tpZm5nOyCys++jBKanlSN6B5ook1/7lplN+KL+UWz8c9dya2BGCPgHrJW
         AB1cE4rzzt07aBRA/3rq/BeyAGe+W0APl9Bx1zM8UC2+EulfStD3wIOxI4vEbV2o0sI/
         9lwjL9sMrUNTqUqNR7C19APFIZAuVPDMMzinH1PeYx3xKrsyj3CvoenqJYZp6iGka/jx
         htQA==
X-Gm-Message-State: APjAAAWZhWH+Vwz43CGakqrJAy6V/VsZjZmbii5sPMF9li31NfbOziGO
        aKm81u0N7xUwWmKuM2oiXx1UOw==
X-Google-Smtp-Source: APXvYqzWL47c/XrOYh04oWDmglEsCxiVO1YA10IZl3NHlV8ZfRlSJTCaKhyMiPXlcF4uoaFIFjc0oA==
X-Received: by 2002:a1c:6389:: with SMTP id x131mr3427409wmb.155.1581399706531;
        Mon, 10 Feb 2020 21:41:46 -0800 (PST)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
        by smtp.gmail.com with ESMTPSA id r15sm2186535wmh.21.2020.02.10.21.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 21:41:45 -0800 (PST)
Date:   Tue, 11 Feb 2020 05:41:42 +0000
From:   Quentin Perret <qperret@google.com>
To:     Nicolas Pitre <nico@fluxnic.net>
Cc:     masahiroy@kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, maennich@google.com,
        kernel-team@android.com, jeyu@kernel.org, hch@infradead.org
Subject: Re: [PATCH v3 1/3] kbuild: allow symbol whitelisting with
 TRIM_UNUSED_KSYMS
Message-ID: <20200211054142.GA72419@google.com>
References: <20200207180755.100561-1-qperret@google.com>
 <20200207180755.100561-2-qperret@google.com>
 <nycvar.YSQ.7.76.2002071319200.1559@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YSQ.7.76.2002071319200.1559@knanqh.ubzr>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Friday 07 Feb 2020 at 13:22:12 (-0500), Nicolas Pitre wrote:
> This "[[ ]]" is a bashism. I think there was an effort not to depend on 
> bash for the build system.

OK, I see.

> So either this needs to be changed to basic 
> bourne shell, or the interpretor has to be /bin/bash not /bin/sh.

So, as per the above, the basic bourne shell option sounds preferable,
I'll go fix this for v4.

Thanks,
Quentin
