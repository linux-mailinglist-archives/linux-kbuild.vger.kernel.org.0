Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFC5314CFCB
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Jan 2020 18:42:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727301AbgA2RmY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 29 Jan 2020 12:42:24 -0500
Received: from pb-smtp1.pobox.com ([64.147.108.70]:51887 "EHLO
        pb-smtp1.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727367AbgA2RmY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Jan 2020 12:42:24 -0500
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id F0A504ABE4;
        Wed, 29 Jan 2020 12:42:21 -0500 (EST)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
        :cc:subject:in-reply-to:message-id:references:mime-version
        :content-type; s=sasl; bh=urXaZyuslkka/AZilaZBFQEXjW0=; b=U8tlsO
        s78YueUM3moRfJqYpeynOXYu55Qau7oh4VNGh9gOGFMBNi0H1VWX+2NlGidfjorB
        REBCC+65j9uYy8nzYU7NJQ7G3CFg/jgGTiv7cHZ0Awf2asfFJuuhWsn01qtD4d6Q
        yJib7QYosnyNmBn2pd2CDqwwS46jIIaX0jGd0=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id E7E494ABE3;
        Wed, 29 Jan 2020 12:42:21 -0500 (EST)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=ypnyA5Le1GB3vJhvCC+unW73zp9xV1VgoxlnMuNbIyM=; b=OdzFqS49NuV/wUi36fGDNunUr5TJ4XfD8SIvD9FxlcksFMU+dVAAcgcx5wuUzJy6+HyZ0FFS6Hv6Gpx8fKVtEMaLh0Tdr6dwWb2jO4uceGmaQQlwFUJXR94LwB1ojM0GqOqzUYdySEC3Lu0uD4L5eLS4Df5hVlpbJ59A18r4ctI=
Received: from yoda.home (unknown [24.203.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 689F44ABE2;
        Wed, 29 Jan 2020 12:42:21 -0500 (EST)
        (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
        by yoda.home (Postfix) with ESMTPSA id 7B2562DA013B;
        Wed, 29 Jan 2020 12:42:20 -0500 (EST)
Date:   Wed, 29 Jan 2020 12:42:20 -0500 (EST)
From:   Nicolas Pitre <nico@fluxnic.net>
To:     Quentin Perret <qperret@google.com>
cc:     masahiroy@kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, maennich@google.com,
        kernel-team@android.com
Subject: Re: [PATCH] kbuild: allow symbol whitelisting with
 TRIM_UNUSED_KSYMS
In-Reply-To: <20200129173714.GA193443@google.com>
Message-ID: <nycvar.YSQ.7.76.2001291240370.1655@knanqh.ubzr>
References: <20200129150612.19200-1-qperret@google.com> <nycvar.YSQ.7.76.2001291152540.1655@knanqh.ubzr> <20200129173714.GA193443@google.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: B3B61098-42BE-11EA-8FFC-C28CBED8090B-78420484!pb-smtp1.pobox.com
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 29 Jan 2020, Quentin Perret wrote:

> On Wednesday 29 Jan 2020 at 12:11:12 (-0500), Nicolas Pitre wrote:
> > This way, if $CONFIG_UNUSED_KSYMS_WHITELIST is non empty, it'll get 
> > quoted.
> 
> A shorter alternative would be something a little like so perhaps ?
> 
> diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
> index 1a6f7f377230..8e1b7f70e800 100755
> --- a/scripts/adjust_autoksyms.sh
> +++ b/scripts/adjust_autoksyms.sh
> @@ -48,7 +48,7 @@ cat > "$new_ksyms_file" << EOT
>  EOT
>  sed 's/ko$/mod/' modules.order |
>  xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
> -cat - $CONFIG_UNUSED_KSYMS_WHITELIST |
> +cat - "${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}" |

That's even better.


Nicolas
