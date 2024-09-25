Return-Path: <linux-kbuild+bounces-3734-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95942986108
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 16:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B8A51F29E5F
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 14:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA24718733C;
	Wed, 25 Sep 2024 13:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="YCFrBm6k"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C6B186E29;
	Wed, 25 Sep 2024 13:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727272304; cv=none; b=mAd6ZelsS4/o3rhH4zoSIDn6YgAftHdEQvT/HD14H6jszrNxygEDfelcUF8cV6t4TTAjsn45zXEvCgM/zfMrTbK0p82aVQbxhoN4+OtotXI63EubiVSYYkKzbUtnl/YSN9Y5Mwg6W+b7Opn9KHdWEp8nlxcWi2wrpCc41y8yQTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727272304; c=relaxed/simple;
	bh=PZOseGL0iHKfe7J6qxH1nvMXMdEDwAT/Xy9zLCH3rGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mdl/1uyaIniE1eMBxaPrEJxg0Plw9E3Bpw+6ufD8a2gWP/t7Sf1TvRoPPwUtl0C04m8VEmSH2rOuXIIPjAPLdWydrSZROi2vZVuM5Swnw5dyZaVNqA3W9GiQpCUaz8jCpLGlsivVcThIfXErYfdivxnxkedk65zFGk8eXhdKlYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=YCFrBm6k; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1727272292; bh=PZOseGL0iHKfe7J6qxH1nvMXMdEDwAT/Xy9zLCH3rGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YCFrBm6k6wflnlpVTTulEJyP+GswIxW6YHKbZacOyy1T8Bq/UqYE6csRcyr/s6GIc
	 RvZVSxEge8lrfQ3rwMMfx4dTKGRZaTu2q6KBo8+iX+mxUaTaK0JUs9lxa4wQOLpccM
	 fNSfklfb2LAbfmPUTMQZUKRubDy4fxaZ41e/5ew0=
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Wed, 25 Sep 2024 15:51:32 +0200 (CEST)
Received: from l-nschier-nb (unknown [61.8.139.63])
	by mail-auth.avm.de (Postfix) with ESMTPSA id 05BDB8077D;
	Wed, 25 Sep 2024 15:51:32 +0200 (CEST)
Date: Wed, 25 Sep 2024 15:51:31 +0200
From: Nicolas Schier <n.schier@avm.de>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	masahiroy@kernel.org, nathan@kernel.org, devicetree@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH] kbuild: fix a typo dt_binding_schema ->
 dt_binding_schemas
Message-ID: <ZvQVY6ChCYdJpBEW@l-nschier-nb>
References: <20240925053230.45606-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240925053230.45606-1-xu.yang_2@nxp.com>
X-purgate-ID: 149429::1727272292-9230AE44-25FB1F99/0/0
X-purgate-type: clean
X-purgate-size: 1339
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

On Wed, Sep 25, 2024 at 01:32:30PM +0800, Xu Yang wrote:
> If we follow "make help" to "make dt_binding_schema", we will see
> below error:
> 
> $ make dt_binding_schema
> make[1]: *** No rule to make target 'dt_binding_schema'.  Stop.
> make: *** [Makefile:224: __sub-make] Error 2
> 
> It should be a typo. So this will fix it.
> 
> Fixes: 604a57ba9781 ("dt-bindings: kbuild: Add separate target/dependency for processed-schema.json")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 265dd990a9b6..7aa71c70305e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1645,7 +1645,7 @@ help:
>  		echo '* dtbs               - Build device tree blobs for enabled boards'; \
>  		echo '  dtbs_install       - Install dtbs to $(INSTALL_DTBS_PATH)'; \
>  		echo '  dt_binding_check   - Validate device tree binding documents and examples'; \
> -		echo '  dt_binding_schema  - Build processed device tree binding schemas'; \
> +		echo '  dt_binding_schemas - Build processed device tree binding schemas'; \
>  		echo '  dtbs_check         - Validate device tree source files';\
>  		echo '')
>  
> -- 
> 2.34.1
> 

Thanks!

Reviewed-by: Nicolas Schier <n.schier@avm.de>

