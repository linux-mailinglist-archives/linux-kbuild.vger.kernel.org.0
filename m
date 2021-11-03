Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 984FA443CF1
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Nov 2021 07:09:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230293AbhKCGL5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Nov 2021 02:11:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:47504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230152AbhKCGL4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Nov 2021 02:11:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C3D95610FC;
        Wed,  3 Nov 2021 06:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635919760;
        bh=Lk2hJwn/SegNkcuMLDc4d/7YgbknXWvcWRkXlxJe5ko=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IioUIUW9ruj3Ectpff9Khw2Y0aMsjeTZbyx2HlHyuEXLscEop7HJwAHUWea3amcKY
         ANN9bC1enr7aohv4Dj4ljmsr2+sav7B0Q0aH3iDxdxTeuKmfaj7maWaBKhNQGd5acL
         vpQ5p3OQg3JBrG0ftZdnivW6RdH3Ze2uKyOyA+KysbTlTx3UavLNnMewc8M7qSqsY3
         Gqte11OM+JbMGMe6R5QoJtOCGmirdMQLpCYyJdnQ0vjD8BdftPrGdwYSNVy9kt6Mvk
         5SAiBC9ZWl53g6Qrttxk3cTbuCyoEkgX3TqEySNL3I//5PqFKNTl8ZDaxDyr6BZraK
         tTz+A2wvQvodw==
Received: by mail-lf1-f48.google.com with SMTP id j2so3070775lfg.3;
        Tue, 02 Nov 2021 23:09:20 -0700 (PDT)
X-Gm-Message-State: AOAM533TBCGH5EbiamxYkLmZkuU9i0Dzvi6e1gOPaQCxQsqMejNH5wuR
        JI5jV2FhcptDpVXmOrI21zYuepRovC+62C1dqpo=
X-Google-Smtp-Source: ABdhPJyWCLx1hA2Ex0BoQRzzE0dGJjAYL5e7kamrUW+pUk1zJI0+C2km8HKzZvTP6XPLNU3m2eWT7IQ6iiiaKqArGIs=
X-Received: by 2002:ac2:5d4b:: with SMTP id w11mr38038128lfd.676.1635919759013;
 Tue, 02 Nov 2021 23:09:19 -0700 (PDT)
MIME-Version: 1.0
References: <7e805797dd70bc40aac9343f82548324ba28cd72.1635407415.git.yang.guang5@zte.com.cn>
In-Reply-To: <7e805797dd70bc40aac9343f82548324ba28cd72.1635407415.git.yang.guang5@zte.com.cn>
From:   Song Liu <song@kernel.org>
Date:   Tue, 2 Nov 2021 23:09:07 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7acBzC--jdGTuiV6gJYn6uJE--J-MLLjcipW1oEMTT=w@mail.gmail.com>
Message-ID: <CAPhsuW7acBzC--jdGTuiV6gJYn6uJE--J-MLLjcipW1oEMTT=w@mail.gmail.com>
Subject: Re: [PATCH v2] raid5-ppl: use swap() to make code cleaner
To:     cgel.zte@gmail.com
Cc:     Paul Menzel <pmenzel@molgen.mpg.de>, linux-kbuild@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>, zealci@zte.com.cn,
        yang.guang5@zte.com.cn
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 28, 2021 at 1:48 AM <cgel.zte@gmail.com> wrote:

By the way, who is the owner of cgel.zte@gmail.com? I see the same
account sending patches for different authors. If it is one person sending
patches for another person, we need "Signed-off-by" from both of them.

Thanks,
Song
