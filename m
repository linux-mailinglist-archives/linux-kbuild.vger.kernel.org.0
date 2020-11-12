Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B31F2B0CEF
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Nov 2020 19:46:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgKLSqg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 12 Nov 2020 13:46:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726217AbgKLSqf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Nov 2020 13:46:35 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06796C0613D1
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Nov 2020 10:46:34 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id i12so4770028qtj.0
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Nov 2020 10:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tEReK/F4LdHkfLA7ujCSSEM6OpcsvQGQze/8znMW/GU=;
        b=g6A7LojCoZbsRssjDTsSsbgEQ0QYuzGiLWBqRGUuD0zAQMJELsjIHzBqmE470y//t/
         B+PmlLJpF3X7E9KrZ66Uj3qENAlLUndFgQp5QMZx4kBbpAsi6bio3cE9Nr9v5AdZx7Et
         u/h8wOFcaklJv6H1mJr7ILXxtFREQ9i1tcbj4Z5xxb+0yd1og4tHoEJT5SW+S8NBTC8w
         IH7iZgty4jsCo+F5/Oau7hGujBumpt19aQWebrrElQZnHDk1XehmCBmy5M2gTS16HxmX
         tNLP59cHxjmZsY3FZXj9LIxzBxNnFqT+hsPgicAFSlMNSBN8GJUOJ186WP+L4FSBAdpu
         mtvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tEReK/F4LdHkfLA7ujCSSEM6OpcsvQGQze/8znMW/GU=;
        b=epd4ThzQxAuzQaweP7RVzlFZtYkBklW06QZLdO0sczTv2oem2Gep8Td24eDTdzmP0x
         GIoDAsVEIXbmrxpi2q1Vn+mE9EprKN4+mhOsZ7islWrq54kmWa4sR+p+yw/stXYq7Dao
         CtLh4hb3R8T/kxjRjBlTPR99ee18p2s66VfNaDhZI2M8Oyp3nJlN4m8NCEy0CL6gYW7b
         Dg+pw9fN33xYCRLbeAc/+w5WRO9FmMByrEa3AQWWWYR4bBXQbYf97MKSkDA2tmGAZzu7
         oCFlfvHW/CTH3D/ytOuj4i9qv4eD8AIroEgfevI5a3DjRwF3CxcqaYC7QbQpuzPwtlGT
         HjfQ==
X-Gm-Message-State: AOAM531fs1B/zI6guKTk5qqDVekBCGVTpfPi4Pn9QUaZTR0RpVc6krOz
        iMjQZUPVAu8C+FitCP0GvdGz5jhRAkQ=
X-Google-Smtp-Source: ABdhPJx5w5o/WXRcIVRxETdFoNzobkR58RsNNzTDdXdYYMsJE9VB27wA04M5VdFqKVaJiqOQcz424g==
X-Received: by 2002:aed:23bb:: with SMTP id j56mr521850qtc.312.1605206793672;
        Thu, 12 Nov 2020 10:46:33 -0800 (PST)
Received: from p51.localdomain (bras-base-mtrlpq4706w-grc-05-174-93-161-125.dsl.bell.ca. [174.93.161.125])
        by smtp.gmail.com with ESMTPSA id e186sm5192157qkd.117.2020.11.12.10.46.32
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 10:46:32 -0800 (PST)
Received: by p51.localdomain (Postfix, from userid 1000)
        id 344021D17274; Thu, 12 Nov 2020 13:46:32 -0500 (EST)
Date:   Thu, 12 Nov 2020 13:46:32 -0500
From:   jrun <darwinskernel@gmail.com>
To:     linux-kbuild@vger.kernel.org
Subject: Re: unwanted built-ins
Message-ID: <20201112184632.udoxoi6pdru6nnsn@savoirfairelinux.com>
References: <20201111163135.f6rjjgldlouspfat@savoirfairelinux.com>
 <b852dcf4-c8d6-c7b3-3833-5c6083883b9e@infradead.org>
 <20201111190045.j37ixzeosd7qxzkm@savoirfairelinux.com>
 <b5452d0b-fc9e-8811-ba3d-c1692a550b39@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b5452d0b-fc9e-8811-ba3d-c1692a550b39@infradead.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Nov 11, 2020 at 07:14:52PM -0800, Randy Dunlap wrote:
> Yeah, that may be the right thing to do, but it would take
> a lot of build testing. My laptops don't have enough horsepower
> for all of that (multiple configs * multiple arch-es).
>
> --
> ~Randy
>

me no horsepower too but who does? i mean i could slam together couple of low
hanging candidates like those in a patch and submit (where? e.g. linux-drm?)
but, do you think it's worth the effort?

- jrun

