Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF0C48E052
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Jan 2022 23:35:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237857AbiAMWfN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 13 Jan 2022 17:35:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235281AbiAMWfN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 13 Jan 2022 17:35:13 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60A4DC061574
        for <linux-kbuild@vger.kernel.org>; Thu, 13 Jan 2022 14:35:13 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id pf13so11917531pjb.0
        for <linux-kbuild@vger.kernel.org>; Thu, 13 Jan 2022 14:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=YbEI3Q/NEjCtDTVCV1jkA7nYNYBH/Wfa2wk3IkVyJko=;
        b=MhcmJOWsvyy8WW6RIx4vCL7wxrGY+bGoU8hTU1m5TZrUtDPvK8XIZ0f5NPTV0W1zuU
         HQlOr18h+VyYDOs9AV1/rr8LGH8aSo5m1kga/ZHTUWijgh/alfKjrND4hEMe/R4GG6a6
         ua4vDU1LZQUWwEMPzJ/uvM+hRA9Cmui6vMDXq2JvULQzgxhuG6ELztfn0sC/e7j6/Fg2
         M1KXQY1eaS3kXSmnrcGMyp8/IVa1+XW4lhDfsDcTVWV5OP0hdbccdRby1LC72I4SAFuC
         lcmkcbl6GUW8YEGmURhiKVJy3fKF51SmtZmWVzuoH3rL+O8hcL3mWTm9zV88qyu1zM9I
         iyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=YbEI3Q/NEjCtDTVCV1jkA7nYNYBH/Wfa2wk3IkVyJko=;
        b=SB/KQhINGJbVIe6BiuiTAOmBkBvpOxwSLpLe8PEuORDmds6ACl1yJqK6Dx2WAvf/Me
         laSnA10aOJAFYmT2JAo7pRPAO03eTyS/thskOtJvWOHQetTTvefnZxcWluU2rYRglqa+
         pN0GY59yqSuekNlCwLxsyXuAuKQ17klmJNkAE1BYzNK7p2LAFbr+G+1S+6hXKJ0Wsudy
         DDGbK4FE40e2INdI0cZOker+mGdIx0brBRhSv+GuB1yvbhm1Gk1PRHjuFak2nQIWCjcQ
         sfti5JolSUlh/qAqlDIOOQgQLY/yN3OrIyHfLyWN8D+eRRKP7oo1jKuKIODEHmRV+qxr
         sZqA==
X-Gm-Message-State: AOAM532+paN6T1Zvck+txHEfKWItiDqJ06qQ0FrTtpGfKnAfzTEkrb0g
        a91/zD9t9vgyKQ2K0Cb+ZjRCkIBqMh79/ZvhATg=
X-Google-Smtp-Source: ABdhPJy/Ee2vWLvZx1hJuegIbv/zT7ifWcgo+3fw2EEDKmlYq9TLzAF31E6JnM+l93VWfJz6NdnEbqrm6UgVSq/zLWY=
X-Received: by 2002:a17:90a:cc0d:: with SMTP id b13mr16787647pju.236.1642113312923;
 Thu, 13 Jan 2022 14:35:12 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6a10:f38c:0:0:0:0 with HTTP; Thu, 13 Jan 2022 14:35:12
 -0800 (PST)
Reply-To: mchristophdaniel@gmail.com
From:   Marcus Galois <marcus.galois@gmail.com>
Date:   Thu, 13 Jan 2022 23:35:12 +0100
Message-ID: <CANqBaXVUiwKJ6bGEoL839OM+yCs0h3tPvh73vranE1GtHwAh2g@mail.gmail.com>
Subject: Good News Finally.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello friend.

You might find it so difficult to remember me, though it is indeed a
very long time, I am much delighted to contact you again after a long
period of time, I remember you despite circumstances that made things
not worked out as we projected then. I want to inform you that the
transaction we're doing together then finally worked out and I decided
to contact you and to let you know because of your tremendous effort
to make things work out then.

Meanwhile I must inform you that I'm presently in Caribbean Island for
numerous business negotiation with some partners. with my sincere
heart i have decided to compensate you with USD$900,000 for your
dedication then on our transaction, you tried so much that period and
I appreciated your effort. I wrote a cheque/check on your name, as
soon as you receive it, you let me know.

Contact my secretary now on his email: mchristophdaniel@gmail.com
Name: Mr. Christoph Daniel

You are to forward to him your Name........ Address.......,Phone
number......for shipment/dispatch of the cheque/Check to you

Regards,
Mr. Marcus Galois
