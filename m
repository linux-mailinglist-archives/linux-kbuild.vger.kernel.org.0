Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FBC02F2751
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Jan 2021 05:47:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732518AbhALEqi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Jan 2021 23:46:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732428AbhALEqi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Jan 2021 23:46:38 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEF88C0617A7
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Jan 2021 20:45:48 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id c12so637526pfo.10
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Jan 2021 20:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lSnLP0cWAgAS1pcWb+CrLNNfSZnSuE1Fm2GJHIQSDOg=;
        b=XozVgz+mp3eWVqaXXdIpVz1Hry6+ZRxOkoib2yzsTGXdTZ+wIShDqsAxUnKu8+Myvx
         E6ZaZM0JsH3cRcZsQ1xXQ+V8pqRJ1JBwVyGfbiIviUee68ivmf3LZ7DX2TV3F1y2OAjz
         7M6kGuaCBvcGk6+pBv/ROLJoDm6T7OMaZTVPftIR06U6mhSfxbw/mIM2ZZJ9n8AkURCW
         C7STgye5lM1hadznW35C8AogpPmER7SjVHYh+yNX6pGjMDu7fmDm1TyOTj8LsFK5wzwt
         dVuR4M/6xvABu6U8WulQcQdroLMXBiesHhrq0H92dmKrKCDN3y8HVUnWZAdDxquFZnQu
         6XJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lSnLP0cWAgAS1pcWb+CrLNNfSZnSuE1Fm2GJHIQSDOg=;
        b=ASBRBFZa86+4erOcAMeMBW8R7YcX2iWsCJdTyDJXvnKD0hHAK3Aq6ovs497UAy+ij8
         nuFGuN0dVyOtMod84/0gs3ltwpOlNaA3tNWcn3fbEUcod7se9+EkRqUyx26VX6hUPryv
         fkqO0sYmK2M6bcUkjylmcViE6I2Ga5r+r6MoxxJM5vNl1dhKwhnQYtg1rORe8pX4f6Z0
         H39SoogHIrDsK2vJEL1XMl+1c3zPHkfazisVkbg6GlR2AwOKo1RQdH3Ss+elz+IbgqcK
         bWJJUFR/dbaF5sSfkppTE4RcXiPuFvd+EeEozjyXcVzC1yl12u5apLvBCIseuOwpRcfb
         UKrw==
X-Gm-Message-State: AOAM530DzUZ1UkiXYthMipKQUF0B6pKSdvD+yaErB+cStWmvRSp0wXur
        GHjaO+PG1H2hW7kAqt+tDn1+bw==
X-Google-Smtp-Source: ABdhPJydjdmJh6nciwHmgyqVF2VriQ4hgVHmiBm3aWTQVQTRpdIuzCa32pbA1jJvOpSY/s0fZE93SQ==
X-Received: by 2002:aa7:9846:0:b029:1ae:7f23:c5 with SMTP id n6-20020aa798460000b02901ae7f2300c5mr2818477pfq.44.1610426748334;
        Mon, 11 Jan 2021 20:45:48 -0800 (PST)
Received: from localhost ([122.172.85.111])
        by smtp.gmail.com with ESMTPSA id d4sm1293665pfo.127.2021.01.11.20.45.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jan 2021 20:45:47 -0800 (PST)
Date:   Tue, 12 Jan 2021 10:15:45 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org
Subject: Re: [PATCH V2 1/2] scripts: dtc: Add fdtoverlay.c and fdtdump.c to
 DTC_SOURCE
Message-ID: <20210112044545.pqz3yxpccnvp6rrd@vireshk-i7>
References: <be5cb12a68d9ac2c35ad9dd50d6b168f7cad6837.1609996381.git.viresh.kumar@linaro.org>
 <f346aea6-b97f-484f-6371-965831fc06fc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f346aea6-b97f-484f-6371-965831fc06fc@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 11-01-21, 16:13, Frank Rowand wrote:
> Hi Viresh,
> 
> On 1/6/21 11:15 PM, Viresh Kumar wrote:
> > We will start building overlays for platforms soon in the kernel and
> > would need these tools going forward. Lets start fetching them.
> > 
> > Note that a copy of fdtdump.c was already copied back in the year 2012,
> > but was never updated or built for some reason.
> > 
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> > V2: Separate out this change from Makefile one.
> > 
> > This needs to be followed by invocation of the ./update-dtc-source.sh
> > script so the relevant files can be copied before the Makefile is
> > updated in the next patch.
> 
> Just an FYI that Rob will do the ./update-dtc-source.sh step at the appropriate
> time, creating a commit to be submitted in his pull request to Linus.
> 
> That way Rob will ensure that all of the updates from the parent project are
> updated in a careful manner.

Right, this is what I expected. I still wrote this in the patch
description to make sure others, who may want to try this stuff,
understand how this works.

-- 
viresh
