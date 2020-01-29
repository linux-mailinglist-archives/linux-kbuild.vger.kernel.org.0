Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27BCA14D077
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Jan 2020 19:29:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbgA2S3Z (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 29 Jan 2020 13:29:25 -0500
Received: from pb-smtp20.pobox.com ([173.228.157.52]:64665 "EHLO
        pb-smtp20.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726328AbgA2S3Z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Jan 2020 13:29:25 -0500
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
        by pb-smtp20.pobox.com (Postfix) with ESMTP id 61EDB9848E;
        Wed, 29 Jan 2020 13:29:20 -0500 (EST)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
        :cc:subject:in-reply-to:message-id:references:mime-version
        :content-type; s=sasl; bh=YxxwQE+PtbwtcZ+NqxkckFVWffE=; b=cnQ8lM
        9G3KTywMmY8D9CKRbfZJMGIIua6NuyuVegI4Xo4h4Qc0X1h8tV1yEcm/30GdYdsX
        ayKAfRqAo4ixrU8LuNCR1VKQ6UR0+/yy1qK/fe5lswT8iEUlJSaD8ximRasBS8+r
        CT6VyNismy0OaWxNiEolbRjy8NaeEOPIBqp68=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
        by pb-smtp20.pobox.com (Postfix) with ESMTP id 5B35E9848D;
        Wed, 29 Jan 2020 13:29:20 -0500 (EST)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=NdIYJBAwqC4KSuECezBIT82kVNCH/WoHKxRtrK6IxoQ=; b=pORAGBlsTZzDG0Tj0Sxthu+kGt1vR1jyU34spcH3FkXhX1n/PGyqYH9tZNoYJ4HcFaiIXgK94sr6zgr9M8DtnFssoxQ5axF9dZ7YL7ORah2PBMjNfNrjgW21l52U1IK/uo+5gZ4+9jQBh2+8iMVKDbar//JtDF6Tz0ud1p/V4IE=
Received: from yoda.home (unknown [24.203.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 4B16D9848A;
        Wed, 29 Jan 2020 13:29:17 -0500 (EST)
        (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
        by yoda.home (Postfix) with ESMTPSA id 5C44C2DA013B;
        Wed, 29 Jan 2020 13:29:15 -0500 (EST)
Date:   Wed, 29 Jan 2020 13:29:15 -0500 (EST)
From:   Nicolas Pitre <nico@fluxnic.net>
To:     Quentin Perret <qperret@google.com>
cc:     masahiroy@kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, maennich@google.com,
        kernel-team@android.com, jeyu@kernel.org
Subject: Re: [PATCH v2] kbuild: allow symbol whitelisting with
 TRIM_UNUSED_KSYMS
In-Reply-To: <20200129181541.105335-1-qperret@google.com>
Message-ID: <nycvar.YSQ.7.76.2001291327540.1655@knanqh.ubzr>
References: <20200129181541.105335-1-qperret@google.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: 421A8A84-42C5-11EA-ACFE-B0405B776F7B-78420484!pb-smtp20.pobox.com
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 29 Jan 2020, Quentin Perret wrote:

> CONFIG_TRIM_UNUSED_KSYMS currently removes all unused exported symbols
> from ksymtab. This works really well when using in-tree drivers, but
> cannot be used in its current form if some of them are out-of-tree.
> 
> Indeed, even if the list of symbols required by out-of-tree drivers is
> known at compile time, the only solution today to guarantee these don't
> get trimmed is to set CONFIG_TRIM_UNUSED_KSYMS=n. This not only wastes
> space, but also makes it difficult to control the ABI usable by vendor
> modules in distribution kernels such as Android. Being able to control
> the kernel ABI surface is particularly useful to ship a unique Generic
> Kernel Image (GKI) for all vendors.
> 
> As such, attempt to improve the situation by enabling users to specify a
> symbol 'whitelist' at compile time. Any symbol specified in this
> whitelist will be kept exported when CONFIG_TRIM_UNUSED_KSYMS is set,
> even if it has no in-tree user. The whitelist is defined as a simple
> text file, listing symbols, one per line.
> 
> Signed-off-by: Quentin Perret <qperret@google.com>

Reviewed-by: Nicolas Pitre <nico@fluxnic.net>


> ---
> v2: make sure to quote the whitelist path properly (Nicolas)
> ---
>  init/Kconfig                | 12 ++++++++++++
>  scripts/adjust_autoksyms.sh |  1 +
>  2 files changed, 13 insertions(+)
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index a34064a031a5..d9c977ef7de5 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -2180,6 +2180,18 @@ config TRIM_UNUSED_KSYMS
>  
>  	  If unsure, or if you need to build out-of-tree modules, say N.
>  
> +config UNUSED_KSYMS_WHITELIST
> +	string "Whitelist of symbols to keep in ksymtab"
> +	depends on TRIM_UNUSED_KSYMS
> +	help
> +	  By default, all unused exported symbols will be trimmed from the
> +	  build when TRIM_UNUSED_KSYMS is selected.
> +
> +	  UNUSED_KSYMS_WHITELIST allows to whitelist symbols that must be kept
> +	  exported at all times, even in absence of in-tree users. The value to
> +	  set here is the path to a text file containing the list of symbols,
> +	  one per line.
> +
>  endif # MODULES
>  
>  config MODULES_TREE_LOOKUP
> diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
> index a904bf1f5e67..8e1b7f70e800 100755
> --- a/scripts/adjust_autoksyms.sh
> +++ b/scripts/adjust_autoksyms.sh
> @@ -48,6 +48,7 @@ cat > "$new_ksyms_file" << EOT
>  EOT
>  sed 's/ko$/mod/' modules.order |
>  xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
> +cat - "${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}" |
>  sort -u |
>  sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$new_ksyms_file"
>  
> -- 
> 2.25.0.341.g760bfbb309-goog
> 
> 
