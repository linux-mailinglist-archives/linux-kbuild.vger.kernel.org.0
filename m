Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EFB015B223
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Feb 2020 21:48:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727548AbgBLUsy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 Feb 2020 15:48:54 -0500
Received: from pb-smtp1.pobox.com ([64.147.108.70]:55868 "EHLO
        pb-smtp1.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727111AbgBLUsy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Feb 2020 15:48:54 -0500
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id 12BBF55B30;
        Wed, 12 Feb 2020 15:48:52 -0500 (EST)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
        :cc:subject:in-reply-to:message-id:references:mime-version
        :content-type; s=sasl; bh=5GPDyBY1KAAr0S2ZkUo91m7Bf6s=; b=mex+J8
        Owd5Ze1R2YaA5KwoVnoQIT02jzOqHZRvUoNEYOMXCTzuChpEIczaNqEitgKMHR8P
        /9hHl9ln77mntYIFfuAtbTa80NexUB8ZQD/NUtF4cw9EjeTFPzlYlVWz+Oe2mTPz
        PHdWNwAPUJTN1/r8iiZ/aIV3aScnDpNI1+IjA=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id 096B755B2F;
        Wed, 12 Feb 2020 15:48:52 -0500 (EST)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=Bp0EdcbKaDs3gCEwDZM9KmJwa83NKzzAz84oizMrUV8=; b=1l0/s3VCLjBqIkeBerOUcSUT+1wyu73kWBGNLxUtuXlcNEymGHsLC7zDJF1xu8xvzlnbyCaPjb+UoFAduLa9DlqE9n8cjTMtOW8mwVVWKPi2LP1OcYZiOAL9n/2xkK1F4iGZ5SrOhKPSQMJuPAljIWTejVJOfdfU8fpqM3JQuMc=
Received: from yoda.home (unknown [24.203.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 7FB1655B2E;
        Wed, 12 Feb 2020 15:48:51 -0500 (EST)
        (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
        by yoda.home (Postfix) with ESMTPSA id 9CB7C2DA09EC;
        Wed, 12 Feb 2020 15:48:50 -0500 (EST)
Date:   Wed, 12 Feb 2020 15:48:50 -0500 (EST)
From:   Nicolas Pitre <nico@fluxnic.net>
To:     Quentin Perret <qperret@google.com>
cc:     masahiroy@kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, maennich@google.com,
        kernel-team@android.com, jeyu@kernel.org, hch@infradead.org
Subject: Re: [PATCH v4 0/3] kbuild: allow symbol whitelisting with
 TRIM_UNUSED_KSYM
In-Reply-To: <20200212202140.138092-1-qperret@google.com>
Message-ID: <nycvar.YSQ.7.76.2002121545120.1559@knanqh.ubzr>
References: <20200212202140.138092-1-qperret@google.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: 134EB9B8-4DD9-11EA-A8FA-C28CBED8090B-78420484!pb-smtp1.pobox.com
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 12 Feb 2020, Quentin Perret wrote:

> The current norm on Android and many other systems is for vendors to
> introduce significant changes to their downstream kernels, and to
> contribute very little (if any) code back upstream. The Generic Kernel
> Image (GKI) project in Android attempts to improve the status-quo by
> having a unique kernel for all android devices of the same architecture,
> regardless of the SoC vendor. The key idea is to make all interested
> parties agree on a common solution, and contribute their code upstream
> to make it available to use by the wider community.
> 
> The kernel-to-drivers ABI on Android devices varies significantly from
> one vendor kernel to another today because of changes to exported
> symbols, dependencies on vendor symbols, and surely other things. The
> first step for GKI is to try and put some order into this by agreeing on
> one version of the ABI that works for everybody.
> 
> For practical reasons, we need to reduce the ABI surface to a subset of
> the exported symbols, simply to make the problem realistically solvable,
> but there is currently no upstream support for this use-case.
> 
> As such, this series attempts to improve the situation by enabling users
> to specify a symbol 'whitelist' at compile time. Any symbol specified in
> this whitelist will be kept exported when CONFIG_TRIM_UNUSED_KSYMS is
> set, even if it has no in-tree user. The whitelist is defined as a
> simple text file, listing symbols, one per line.

For the whole series:

Acked-by: Nicolas Pitre <nico@fluxnic.net>


Nicolas
