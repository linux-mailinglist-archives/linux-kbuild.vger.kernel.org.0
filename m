Return-Path: <linux-kbuild+bounces-5183-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BC89F71A1
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 02:19:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD5931689DA
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 01:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8FC45009;
	Thu, 19 Dec 2024 01:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DDUEV+rg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B883594B
	for <linux-kbuild@vger.kernel.org>; Thu, 19 Dec 2024 01:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734571131; cv=none; b=aweilV9tm3IKmIKcvDp4RN15SzVaZS9Hdz2mmdiQYA5EpSyJAkI0HxKmDDBAZq3+Pqq/7oix4hdcf24qHsV7A+6QgqkAylJzNW0x6huqql9ingMgS7YfWK2rKYyCiWLEuOn6/k/Vt+jWynr3PatTCDbpMlfGm1eUpvRqDwGuoQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734571131; c=relaxed/simple;
	bh=zOPYZ0noYe5xCNfWNHHE5VT+VOJySgqJczmIywH5aKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K3MnHW46Ds8qkEgzTYaHSdRtzxMHswkfrApAHtgrxGZa8Rwi7nO5pcuuC08vxvamVd3CUubXUoqm44pbtxf9ukfHV60wKDkcOhQNiKnXgsA22uAJi8Xd2RJFQMycvx715tIIvIACjCZT/qyl5Js5pio1VtXSHQydpU6BS5RowCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DDUEV+rg; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-72739105e02so318809b3a.0
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Dec 2024 17:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734571128; x=1735175928; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8GKLWgSaFyOyBanOdsrMy5uvCwvu9h4/1PoCzkqGNIc=;
        b=DDUEV+rgti6lOefmxE/m3JoUE7eovl/KRvwqtOAzERsSIJgcRUGzdLpyVumE1+uJA/
         MZLa2lhJ8l5mqPMpz0SaIkcaR+LlxoITlYK3q+SoxUoUfuOaCix0vHC4FKlU+aodmco7
         MFYZskMq8DMEPuhnpPTjrnRFpvR2jkcplWDzDub0mhJxevzC62sTtZ8O+FIE9EiSfdD5
         Vo5E6hM2T/xzpXd77iqXDhJnBC3fTxi5a3YxoaqQhsSrglV2EHD0BfP3I/EF1om/Jh50
         3xvOUQCwp0tgqARTAHLuXPHETYZEiWmVSXKs0XCloQ7dgMEHrE3CFObju7GVJU5ozidR
         1NuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734571128; x=1735175928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8GKLWgSaFyOyBanOdsrMy5uvCwvu9h4/1PoCzkqGNIc=;
        b=se3Ur+7+619ad4oHPyIQCY9c3fK6riBuNvrUXlBWpOefG0gfB6WeRoZywLHBLJwPsg
         pa4S8CIgzJDf/tsXKY2Vyhbxig0VXx7RRo+qES9lfvTcS+sGnlgA0O4RPwszW9NQFNbi
         DPFm18HluMUS0KX0rNA9gbliFxIdJxo16MbDw9PhSNjdOvlNFAWqMZkTZJfSgOhA+IeA
         DpgoRRD8bbxwIgsIuxizcNOuE1KKQ07IPaNNROwOedFDdxEhb8HBLC2wfEyprnYTAnyL
         VgWPjKelK6szW91Un16oJVHwhslGf4NQv/zsTJJHOMqxGoo479v34iKAZr55K6izoop3
         Y4yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrXMtXR6/4qGPUUpwHuQ/2BdFPnYePbgsMjxeFgQb7joPIK49ar+wNyUUMxStm9Xnkdu16vn9bDuct8Wo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPCIz3MMWf5uAaiXLAeb5XPoA+pUIuq+Z62Z7aZyq6PWQp0JAK
	P8ZYih0U9rvcxCcVxzQ96UjjJjWaGZUJkR4tNE9tjSKlVxPcKsCJPD9Inc94Ww==
X-Gm-Gg: ASbGncsa5ld/AFoqrKh8qlvDGb4duvlkx5Og9YJv3A08rkRYlcuaXGAHIVyznPV0IoU
	0gyMoy8CBYvZ0zc9pRVxkuQsG8TpyW3FmQ1DS6+Vp7lxLD00kIqXtLff0uiROsDcCsHk3nMvfAu
	SgjHQ/6BzoMVbLRbBntR18BGEoasQfAQtLwdB0kfB0Sp0qaeVRL+BAkSFlZKHMNrXOxqz0QsVKi
	a0eStvvGEeBqoHqUipk3KPg5HXBRjqty6o6upXOzo/iMsrqOMJaq0VUDn+wky40K8tWbY3zoFIr
	V0oecBIl5etF24Sa
X-Google-Smtp-Source: AGHT+IEoV352txeBY/6Pj7PNTU6sj27JgQG9dJ+WPNC4pwZzHlRD1/Fnho5ilUQmlFeoHJFXMc2mcQ==
X-Received: by 2002:a05:6a00:f8a:b0:725:9dc7:4f8b with SMTP id d2e1a72fcca58-72a8d23f53bmr6772048b3a.15.1734571127716;
        Wed, 18 Dec 2024 17:18:47 -0800 (PST)
Received: from google.com (30.176.125.34.bc.googleusercontent.com. [34.125.176.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8347d1sm116676b3a.66.2024.12.18.17.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 17:18:46 -0800 (PST)
Date: Thu, 19 Dec 2024 01:18:42 +0000
From: Benson Leung <bleung@google.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org,
	linux-usb@vger.kernel.org, chrome-platform@lists.linux.dev,
	akuchynski@google.com, sboyd@kernel.org, pmalani@chromium.org,
	badhri@google.com, rdbabiera@google.com,
	dmitry.baryshkov@linaro.org, jthies@google.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/8] usb: typec: Only use SVID for matching altmodes
Message-ID: <Z2N0cjJU_RzEZfWh@google.com>
References: <20241213233552.451927-1-abhishekpandit@chromium.org>
 <20241213153543.v5.1.Ie0d37646f18461234777d88b4c3e21faed92ed4f@changeid>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Y2G4k320tFOEEIbr"
Content-Disposition: inline
In-Reply-To: <20241213153543.v5.1.Ie0d37646f18461234777d88b4c3e21faed92ed4f@changeid>


--Y2G4k320tFOEEIbr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 03:35:42PM -0800, Abhishek Pandit-Subedi wrote:
> Mode in struct typec_altmode is used to indicate the index of the
> altmode on a port, partner or plug. It is used in enter mode VDMs but
> doesn't make much sense for matching against altmode drivers or for
> matching partner to port altmodes.
>=20
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>



> ---
>=20
> Changes in v5:
> - Rebase with module_alias_printf
>=20
> Changes in v3:
> - Removed mode from altmode device ids
> - Updated modalias for typecd bus to remove mode
> - Re-ordered to start of series
>=20
> Changes in v2:
> - Update altmode_match to ignore mode entirely
> - Also apply the same behavior to typec_match
>=20
>  drivers/usb/typec/altmodes/displayport.c | 2 +-
>  drivers/usb/typec/altmodes/nvidia.c      | 2 +-
>  drivers/usb/typec/bus.c                  | 6 ++----
>  drivers/usb/typec/class.c                | 4 ++--
>  scripts/mod/devicetable-offsets.c        | 1 -
>  scripts/mod/file2alias.c                 | 9 ++-------
>  6 files changed, 8 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec=
/altmodes/displayport.c
> index 2f03190a9873..3245e03d59e6 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -791,7 +791,7 @@ void dp_altmode_remove(struct typec_altmode *alt)
>  EXPORT_SYMBOL_GPL(dp_altmode_remove);
> =20
>  static const struct typec_device_id dp_typec_id[] =3D {
> -	{ USB_TYPEC_DP_SID, USB_TYPEC_DP_MODE },
> +	{ USB_TYPEC_DP_SID },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(typec, dp_typec_id);
> diff --git a/drivers/usb/typec/altmodes/nvidia.c b/drivers/usb/typec/altm=
odes/nvidia.c
> index fe70b36f078f..2b77d931e494 100644
> --- a/drivers/usb/typec/altmodes/nvidia.c
> +++ b/drivers/usb/typec/altmodes/nvidia.c
> @@ -24,7 +24,7 @@ static void nvidia_altmode_remove(struct typec_altmode =
*alt)
>  }
> =20
>  static const struct typec_device_id nvidia_typec_id[] =3D {
> -	{ USB_TYPEC_NVIDIA_VLINK_SID, TYPEC_ANY_MODE },
> +	{ USB_TYPEC_NVIDIA_VLINK_SID },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(typec, nvidia_typec_id);
> diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
> index aa879253d3b8..ae90688d23e4 100644
> --- a/drivers/usb/typec/bus.c
> +++ b/drivers/usb/typec/bus.c
> @@ -454,8 +454,7 @@ static int typec_match(struct device *dev, const stru=
ct device_driver *driver)
>  	const struct typec_device_id *id;
> =20
>  	for (id =3D drv->id_table; id->svid; id++)
> -		if (id->svid =3D=3D altmode->svid &&
> -		    (id->mode =3D=3D TYPEC_ANY_MODE || id->mode =3D=3D altmode->mode))
> +		if (id->svid =3D=3D altmode->svid)
>  			return 1;
>  	return 0;
>  }
> @@ -470,8 +469,7 @@ static int typec_uevent(const struct device *dev, str=
uct kobj_uevent_env *env)
>  	if (add_uevent_var(env, "MODE=3D%u", altmode->mode))
>  		return -ENOMEM;
> =20
> -	return add_uevent_var(env, "MODALIAS=3Dtypec:id%04Xm%02X",
> -			      altmode->svid, altmode->mode);
> +	return add_uevent_var(env, "MODALIAS=3Dtypec:id%04X", altmode->svid);
>  }
> =20
>  static int typec_altmode_create_links(struct altmode *alt)
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 4b3047e055a3..febe453b96be 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -237,13 +237,13 @@ static int altmode_match(struct device *dev, void *=
data)
>  	if (!is_typec_altmode(dev))
>  		return 0;
> =20
> -	return ((adev->svid =3D=3D id->svid) && (adev->mode =3D=3D id->mode));
> +	return (adev->svid =3D=3D id->svid);
>  }
> =20
>  static void typec_altmode_set_partner(struct altmode *altmode)
>  {
>  	struct typec_altmode *adev =3D &altmode->adev;
> -	struct typec_device_id id =3D { adev->svid, adev->mode, };
> +	struct typec_device_id id =3D { adev->svid };
>  	struct typec_port *port =3D typec_altmode2port(adev);
>  	struct altmode *partner;
>  	struct device *dev;
> diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-=
offsets.c
> index 9c7b404defbd..d3d00e85edf7 100644
> --- a/scripts/mod/devicetable-offsets.c
> +++ b/scripts/mod/devicetable-offsets.c
> @@ -237,7 +237,6 @@ int main(void)
> =20
>  	DEVID(typec_device_id);
>  	DEVID_FIELD(typec_device_id, svid);
> -	DEVID_FIELD(typec_device_id, mode);
> =20
>  	DEVID(tee_client_device_id);
>  	DEVID_FIELD(tee_client_device_id, uuid);
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index 5b5745f00eb3..7049c31062c6 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -1221,17 +1221,12 @@ static void do_tbsvc_entry(struct module *mod, vo=
id *symval)
>  	module_alias_printf(mod, true, "tbsvc:%s", alias);
>  }
> =20
> -/* Looks like: typec:idNmN */
> +/* Looks like: typec:idN */
>  static void do_typec_entry(struct module *mod, void *symval)
>  {
> -	char alias[256] =3D {};
> -
>  	DEF_FIELD(symval, typec_device_id, svid);
> -	DEF_FIELD(symval, typec_device_id, mode);
> -
> -	ADD(alias, "m", mode !=3D TYPEC_ANY_MODE, mode);
> =20
> -	module_alias_printf(mod, false, "typec:id%04X%s", svid, alias);
> +	module_alias_printf(mod, false, "typec:id%04X", svid);
>  }
> =20
>  /* Looks like: tee:uuid */
> --=20
> 2.47.1.613.gc27f4b7a9f-goog
>=20
>=20

--Y2G4k320tFOEEIbr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZ2N0cgAKCRBzbaomhzOw
wkw0AP9VNknHcWgUi7nZvPhRVKYlBqDN0DYORfEm9tw+ROo1kgD+Ph0CXzQGAWwR
xRrlRwx/IlWTbIyp0C1gVTTpSLFseAg=
=uW64
-----END PGP SIGNATURE-----

--Y2G4k320tFOEEIbr--

