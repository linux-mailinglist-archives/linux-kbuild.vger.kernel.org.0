Return-Path: <linux-kbuild+bounces-5081-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1529EC95A
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Dec 2024 10:40:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACBA0281BC2
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Dec 2024 09:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 297011A8415;
	Wed, 11 Dec 2024 09:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F+CWh6Xy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B26B236FB7;
	Wed, 11 Dec 2024 09:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733910056; cv=none; b=dvjRp0fri4skjHEtCDM9Y5nhslT2Ne6Z0BtQtPVf+wzf+hK00cU5zysi+I6Y6lN7/O8QGeBP2BkyGQAxFl1MfiF4cchRTFTVhAjbgfQdDjQ41iqKs27mJ6sORFJOGOqsjeXNC+/z7sA8ZC3tga+9jv69X6mQ55wgem3p+igW0ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733910056; c=relaxed/simple;
	bh=GS5Z33ohQY2/h9ot0AUWoBG8q6TtS3G7qEZ7HPbHInU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FIrl3z1ZolgAb9bIviBCjWQh7B5sFI0gmYXID85T25/ApojygVoQjH+OWz9ynHlGUEsm0kw57c9TiHJR6XkS2J97NXIz8h17EZMX+8ZAbNdpSjF1CAHx5XqNeoGgBwckid0/Z5qIougJzDtWbU5YPhxCpa4In61eEsFh64/pvRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F+CWh6Xy; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733910054; x=1765446054;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GS5Z33ohQY2/h9ot0AUWoBG8q6TtS3G7qEZ7HPbHInU=;
  b=F+CWh6Xy90nal7PeqTxrCEwAFSMmk0C+lhkxr+TOsWAyCx9ixXSUptNU
   CTP+WgdB/12RgBic7hh+fX/1dj+jlm2UQQKdkpz73me+wkKtbaGZ4Q9fB
   0oVmdpQZ1AyLVzmbgacYuTbpC/tlpERpOtPJnIG4K04GKQ9AOfne4Co/U
   ehthCBhNpFWu0vL681Ro2jfsflNRmzMJPpBePm6/MPTLgNMN93HRey6AN
   CLsbliecXZA/FJsdMxZdSn4/OyWBUiwY84qhztI8fRzynlQOQvQJp80qG
   E6YyS4KDseOptuTYV2Klekdu/D31MIl/5DjVMIx3rgNb+RtzFiEyljdOG
   A==;
X-CSE-ConnectionGUID: a+IrBPUiTlyxNZAIez5DCw==
X-CSE-MsgGUID: rQArnoC9T16PZ1IqClp6bA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="37117047"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; 
   d="scan'208";a="37117047"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 01:40:54 -0800
X-CSE-ConnectionGUID: jLknP7QSS2y7aIPjuiF0Kg==
X-CSE-MsgGUID: ejgYfS7HRvCb5auIaQiC5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; 
   d="scan'208";a="95604206"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa009.jf.intel.com with SMTP; 11 Dec 2024 01:40:49 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 11 Dec 2024 11:40:48 +0200
Date: Wed, 11 Dec 2024 11:40:48 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: tzungbi@kernel.org, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev, akuchynski@google.com,
	pmalani@chromium.org, jthies@google.com,
	dmitry.baryshkov@linaro.org, badhri@google.com,
	rdbabiera@google.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/7] usb: typec: Only use SVID for matching altmodes
Message-ID: <Z1leIAhqopg_We9F@kuha.fi.intel.com>
References: <20241206233830.2401638-1-abhishekpandit@chromium.org>
 <20241206153813.v4.1.Ie0d37646f18461234777d88b4c3e21faed92ed4f@changeid>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206153813.v4.1.Ie0d37646f18461234777d88b4c3e21faed92ed4f@changeid>

On Fri, Dec 06, 2024 at 03:38:12PM -0800, Abhishek Pandit-Subedi wrote:
> Mode in struct typec_altmode is used to indicate the index of the
> altmode on a port, partner or plug. It is used in enter mode VDMs but
> doesn't make much sense for matching against altmode drivers or for
> matching partner to port altmodes.
> 
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> 
> (no changes since v3)
> 
> Changes in v3:
> - Removed mode from altmode device ids
> - Updated modalias for typecd bus to remove mode
> - Re-ordered to start of series
> 
> Changes in v2:
> - Update altmode_match to ignore mode entirely
> - Also apply the same behavior to typec_match
> 
>  drivers/usb/typec/altmodes/displayport.c | 2 +-
>  drivers/usb/typec/altmodes/nvidia.c      | 2 +-
>  drivers/usb/typec/bus.c                  | 6 ++----
>  drivers/usb/typec/class.c                | 4 ++--
>  scripts/mod/devicetable-offsets.c        | 1 -
>  scripts/mod/file2alias.c                 | 4 +---
>  6 files changed, 7 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index 2f03190a9873..3245e03d59e6 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -791,7 +791,7 @@ void dp_altmode_remove(struct typec_altmode *alt)
>  EXPORT_SYMBOL_GPL(dp_altmode_remove);
>  
>  static const struct typec_device_id dp_typec_id[] = {
> -	{ USB_TYPEC_DP_SID, USB_TYPEC_DP_MODE },
> +	{ USB_TYPEC_DP_SID },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(typec, dp_typec_id);
> diff --git a/drivers/usb/typec/altmodes/nvidia.c b/drivers/usb/typec/altmodes/nvidia.c
> index fe70b36f078f..2b77d931e494 100644
> --- a/drivers/usb/typec/altmodes/nvidia.c
> +++ b/drivers/usb/typec/altmodes/nvidia.c
> @@ -24,7 +24,7 @@ static void nvidia_altmode_remove(struct typec_altmode *alt)
>  }
>  
>  static const struct typec_device_id nvidia_typec_id[] = {
> -	{ USB_TYPEC_NVIDIA_VLINK_SID, TYPEC_ANY_MODE },
> +	{ USB_TYPEC_NVIDIA_VLINK_SID },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(typec, nvidia_typec_id);
> diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
> index aa879253d3b8..ae90688d23e4 100644
> --- a/drivers/usb/typec/bus.c
> +++ b/drivers/usb/typec/bus.c
> @@ -454,8 +454,7 @@ static int typec_match(struct device *dev, const struct device_driver *driver)
>  	const struct typec_device_id *id;
>  
>  	for (id = drv->id_table; id->svid; id++)
> -		if (id->svid == altmode->svid &&
> -		    (id->mode == TYPEC_ANY_MODE || id->mode == altmode->mode))
> +		if (id->svid == altmode->svid)
>  			return 1;
>  	return 0;
>  }
> @@ -470,8 +469,7 @@ static int typec_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  	if (add_uevent_var(env, "MODE=%u", altmode->mode))
>  		return -ENOMEM;
>  
> -	return add_uevent_var(env, "MODALIAS=typec:id%04Xm%02X",
> -			      altmode->svid, altmode->mode);
> +	return add_uevent_var(env, "MODALIAS=typec:id%04X", altmode->svid);
>  }
>  
>  static int typec_altmode_create_links(struct altmode *alt)
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 4b3047e055a3..febe453b96be 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -237,13 +237,13 @@ static int altmode_match(struct device *dev, void *data)
>  	if (!is_typec_altmode(dev))
>  		return 0;
>  
> -	return ((adev->svid == id->svid) && (adev->mode == id->mode));
> +	return (adev->svid == id->svid);
>  }
>  
>  static void typec_altmode_set_partner(struct altmode *altmode)
>  {
>  	struct typec_altmode *adev = &altmode->adev;
> -	struct typec_device_id id = { adev->svid, adev->mode, };
> +	struct typec_device_id id = { adev->svid };
>  	struct typec_port *port = typec_altmode2port(adev);
>  	struct altmode *partner;
>  	struct device *dev;
> diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
> index 9c7b404defbd..d3d00e85edf7 100644
> --- a/scripts/mod/devicetable-offsets.c
> +++ b/scripts/mod/devicetable-offsets.c
> @@ -237,7 +237,6 @@ int main(void)
>  
>  	DEVID(typec_device_id);
>  	DEVID_FIELD(typec_device_id, svid);
> -	DEVID_FIELD(typec_device_id, mode);
>  
>  	DEVID(tee_client_device_id);
>  	DEVID_FIELD(tee_client_device_id, uuid);
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index c4cc11aa558f..218ccb7150bf 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -1343,14 +1343,12 @@ static int do_tbsvc_entry(const char *filename, void *symval, char *alias)
>  	return 1;
>  }
>  
> -/* Looks like: typec:idNmN */
> +/* Looks like: typec:idN */
>  static int do_typec_entry(const char *filename, void *symval, char *alias)
>  {
>  	DEF_FIELD(symval, typec_device_id, svid);
> -	DEF_FIELD(symval, typec_device_id, mode);
>  
>  	sprintf(alias, "typec:id%04X", svid);
> -	ADD(alias, "m", mode != TYPEC_ANY_MODE, mode);
>  
>  	return 1;
>  }
> -- 
> 2.47.0.338.g60cca15819-goog

-- 
heikki

