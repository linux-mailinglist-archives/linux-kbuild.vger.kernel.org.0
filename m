Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26ACA2CA55F
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Dec 2020 15:18:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729349AbgLAOON (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Dec 2020 09:14:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729159AbgLAOOM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Dec 2020 09:14:12 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BA4EC0613CF
        for <linux-kbuild@vger.kernel.org>; Tue,  1 Dec 2020 06:13:32 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id p8so2848186wrx.5
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Dec 2020 06:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4ehqe7Y++cS0wt3gaymi/r3HazRaNqrXWmoutWXgkJI=;
        b=lZtqI0O05N1Z6dBLwLIaL34QXzkEGIU49CpWF5bKywPYvc+NsWlLRJB0jBInC90Mt3
         89664T8lO6L0YFi13mP2WcsaAhioSBSD4FWBbi6qqWT3STAgmu93CNaVR6LGQ3FqmcPI
         YLyBVZrr7mD1csA7NvKqYE2HQKEMxKuA8xu5QlXB/KwMoLnF+t8zYN+h4dpgHCqap7QC
         1EzNcO0dt3YFIHsnoNQBnnnjulsdkJlLYlTi0LR3pTX8ULCGm90EWmy1PEzaMwdvt9Pu
         2+ZN8BuknXL4/cDhHQ4TJaXyyKwF6IzTh0BdqogMaaBuEIYhwCzlpyXK+4Ma4CeDjgWI
         OwIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4ehqe7Y++cS0wt3gaymi/r3HazRaNqrXWmoutWXgkJI=;
        b=t20FJnX1bVQ+u+FSwHbnQKMDIR1Y0agQXVaFU6D3mpzo/1lLdIXsb+a01irBwTEHqy
         3Za4g8BE7V1Qlm/MmH8SjzSyUJD78gj6J+to2j+ZS/EdQXQH39pxumGznHUYtvmmWt1Q
         7FHfzyHn+OYPz1eVAwfPiP0eGRDLIol+kTfJi/D3vucF9dDhf+bnppggLmFldbck4onT
         9cDuUtvr+wO5Jcwdzn3oDm+eKuE9UoLtV0U7Xreiefb/KNKAcRVapg9XoNKskvtrFUEl
         harcH1EAG93C9p/lmQuEPChVJ9ovI+Wc/7VnDg5pcA9ISaAMcNg0cB/L2ABRqUxfvhQU
         /9Rg==
X-Gm-Message-State: AOAM530dHueYoluhbDlc6gb/DRx+cG4zqb0ZoXEGJlk1PUEPcR+Mrvbj
        I/USTYaEsjIASJCcD4nGwEUEo+Ylwx2ISg==
X-Google-Smtp-Source: ABdhPJwilnfXoPtU9DBAwnwLx6lDBU4zU3VtOOSKMiSYHW5am3EAODESWMH7shcHRj6lfYnWD3lu6g==
X-Received: by 2002:a05:6000:347:: with SMTP id e7mr4104757wre.35.1606832011144;
        Tue, 01 Dec 2020 06:13:31 -0800 (PST)
Received: from google.com ([2a00:79e0:d:210:f693:9fff:fef4:a7ef])
        by smtp.gmail.com with ESMTPSA id k16sm3390851wrl.65.2020.12.01.06.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 06:13:30 -0800 (PST)
Date:   Tue, 1 Dec 2020 14:13:27 +0000
From:   Quentin Perret <qperret@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Cc: Android Kernel" <kernel-team@android.com>
Subject: Re: [PATCH] modpost: Make static exports fatal
Message-ID: <20201201141327.GA1914005@google.com>
References: <20201124182420.2202514-1-qperret@google.com>
 <CAK7LNATj8C7C=dYcDD4M5Q-Zc_kUhY2+i6epH=LbiOAUaDZqiw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNATj8C7C=dYcDD4M5Q-Zc_kUhY2+i6epH=LbiOAUaDZqiw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tuesday 01 Dec 2020 at 23:00:37 (+0900), Masahiro Yamada wrote:
> I am not a big fan of (ab)using fatal() for this case.
> 
> Please consider using error() once
> the following is queued up.
> 
> https://patchwork.kernel.org/project/linux-kbuild/patch/20201201103418.675850-2-masahiroy@kernel.org/

Yes, much nicer, thanks for that series.
I'll post a v2 shortly.

Thanks,
Quentin
