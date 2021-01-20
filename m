Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3E872FCA5D
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Jan 2021 06:13:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbhATFNe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Jan 2021 00:13:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730003AbhATFGv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Jan 2021 00:06:51 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCE79C061575
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Jan 2021 21:06:10 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id x12so11846554plr.10
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Jan 2021 21:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Hzg6y4zoFYD+EUAndxjbqw0YNJbPZQFi+C0cZWASRds=;
        b=BugPfUCLnUl2CU81CWTWpiBV2A2yz92kQdY4tGEddrQkOPkGVQcQ3gWjXKVlUw6lWT
         eqbT3jEnKOD/8Oxd+1WZHNlWblsehnn1ISaSrPhdV/BwOZotbwaTmye1S4X3WNMoZZVK
         z6OqUugNbK3fLsD5FAmyXU1bWa4WurbyF96lsi39TV830sUTKbnMbYMMSAYc5DpOuLEr
         7E2+km1hzTiO73vhGGv0j/2M+m2J4kiBsTFzpzzkeeSRj/Uv/jfZVD6+OZd+Wp5EtyA5
         poNnZUNvY8dl2WKk+FaunZf7hyzasd4uA+1UxmRf1t363ODeepjVJt5CPZQT1hZEH4wG
         ueIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Hzg6y4zoFYD+EUAndxjbqw0YNJbPZQFi+C0cZWASRds=;
        b=XVpGcnyH90eZz/2YF1TL6uxBe2Ny6lZXRuWW9b6AJIius5eGWkKVgoLQvtk53Q6H2q
         DkycwEkK+nB2sr2PToPK7KLqj9GRPkOoi47bMUbvVtwA95euViQqKWMUxzC+dyUEdvc/
         USXyX3AIllr350FoVBfuTYj3x2HgxzLCx4vdowdllDAh81dyV2OW5Fr6NWm/Opat+Bro
         AOiUYMxHiAoLwBlqfM0zPLcTU23zF8xOzN2vlC+o13qE/FrfV5pT3UDLjCALFrii3quX
         PHEevffRzez1T5aj9O3iIxWHBOVXyjDdd+N5G4tKLvKZKaN7YzNvPUsCSYCA/bfH/OB9
         6dqg==
X-Gm-Message-State: AOAM530cVaSqjrgMDPXgCO5C6/F++pZEu0ybFztBovZESfAWPes5v7uj
        zbdQsAF2GF8xy5olmLMS0VP5Jw==
X-Google-Smtp-Source: ABdhPJywCR4oiBs6YZqxbz7ud0eRJJyQ/e2dFnM4aN4PRBfDeBcYh6l9mrpWE0qtn1ThAV6Olnxo9w==
X-Received: by 2002:a17:902:728b:b029:de:c843:1d4c with SMTP id d11-20020a170902728bb02900dec8431d4cmr5473202pll.84.1611119170246;
        Tue, 19 Jan 2021 21:06:10 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id r20sm658333pgb.3.2021.01.19.21.06.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jan 2021 21:06:09 -0800 (PST)
Date:   Wed, 20 Jan 2021 10:36:06 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] of: unittest: Statically apply overlays using fdtoverlay
Message-ID: <20210120050606.b2m4jssh73wexybx@vireshk-i7>
References: <1e42183ccafa1afba33b3e79a4e3efd3329fd133.1610095159.git.viresh.kumar@linaro.org>
 <20210119022154.2338781-1-frowand.list@gmail.com>
 <20210119080546.dzec3jatsz2662qs@vireshk-i7>
 <f7133d16-510b-f730-a43b-89edab08aabe@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7133d16-510b-f730-a43b-89edab08aabe@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 19-01-21, 09:44, Frank Rowand wrote:
> No.  overlay_base.dts is intentionally compiled into a base FDT, not
> an overlay.  Unittest intentionally unflattens this FDT in early boot,
> in association with unflattening the system FDT.  One key intent
> behind this is to use the same memory allocation method that is
> used for the system FDT.
> 
> Do not try to convert overlay_base.dts into an overlay.

Okay, but why does it have /plugin/; specified in it then ?

And shouldn't we create two separate dtb-s now, static_test.dtb and
static_overlay_test.dtb ? As fdtoverlay will not be able to merge it with
testcase.dtb anyway.

Or maybe we can create another file static_overlay.dts (like testcases.dts)
which can include both testcases.dts and overlay_base.dts, and then we can
create static_test.dtb out of it ? That won't impact the runtime tests at all.

-- 
viresh
