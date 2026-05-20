Return-Path: <linux-kbuild+bounces-13293-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KR8FHfIDWor3QUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13293-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 May 2026 16:43:03 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5CE58FE2C
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 May 2026 16:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 69A8130BDAE6
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 May 2026 14:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563423EAC83;
	Wed, 20 May 2026 14:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJB/TuTo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1642BE7AB;
	Wed, 20 May 2026 14:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779287542; cv=none; b=JBpUsykj7h8NH/iuxKBf+OiViMEHV6DiJrubkM1Rhe4QJNirQTMqh4vbdr1588lYaK4peHntfpFfLvpoVasOHkTU1n7b5GwH7rG4CC9ORYsLBpADBbysGwYXuhsb7pU/m+tyIHLh1Lc4fTs0wV9LS/uLZHnfdVPqVw2L/g7r8uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779287542; c=relaxed/simple;
	bh=jLham3+OIjKRsTPNXvnvLvMW6DyEontRwkPGpdUjMf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+T3YYVYtW7J7XHEvOl2+iGsqccoxIL3CIvt/aOPJGFA9Uwq8bUaWFK3nGo/ksXt7N6TDFzUfMnQx7HmuouQybSxDf8bO88k7MDDKtJgH0EuhkVPUEr8jUZb2nCZUbu1SjUzfK7NDufQk9FB+P3+PKC58KI/xl485qr+/D5xJo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJB/TuTo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10BE61F000E9;
	Wed, 20 May 2026 14:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779287540;
	bh=vAqhXt6lj82URSARgDuUgxS2ppBm7kavWdsFVsDgvR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iJB/TuTo8LqLljfJT2TklC0tI/G/ecO3RlukG11d8nNF5K+xBqId6olm7ulsg4wQ9
	 CLKyPye02eFfossrMdhOBI6ogKZXxneKqy8SHfUgr5ZMlkifbhb0zmzRtASQ9B3egS
	 9oGoil0kY5cxxeiepDF8lF0PuTeqRevBDa9IL9l1es+yizXK5p+haaorsCMP/RBZnX
	 WBrJd6bqTYWqORtdq+v5iOvJRWSYHWffZWQaaVmlha5YHqG+NK6bTaBWad8OcREAGB
	 0llrT/fiGMcVtvynmcN7Dj2IxI4XFqpbY6A90qKKXu7Tk47Bl186M8un6/YMVBvNBI
	 hE1t4e5WORTlg==
Date: Wed, 20 May 2026 16:31:30 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Meyer <thomas@m3y3r.de>, Miguel Ojeda <ojeda@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kconfig: add optional warnings for changed input values
Message-ID: <ag3FwqUottk-pIkL@derry.ads.avm.de>
References: <20260406233001.1-kconfig-warn-changed-input-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wm9TWPGmtFDoyYd+"
Content-Disposition: inline
In-Reply-To: <20260406233001.1-kconfig-warn-changed-input-pengpeng@iscas.ac.cn>
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13293-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,sashiko.dev:url,iscas.ac.cn:email,derry.ads.avm.de:mid]
X-Rspamd-Queue-Id: 0A5CE58FE2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--wm9TWPGmtFDoyYd+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 06, 2026 at 11:06:19PM +0800, Pengpeng Hou wrote:
> When reading .config input, Kconfig stores user-provided values first and
> then resolves the final value after applying dependencies, ranges, and
> other constraints.
>=20
> If the final value differs from the user's input, Kconfig already tracks
> that state internally, but it does not provide any focused diagnostic to
> show which explicit inputs were adjusted. This is particularly confusing
> for requested values that get forced down by unmet dependencies or clamped
> by ranges.
>=20
> Add an opt-in diagnostic controlled by KCONFIG_WARN_CHANGED_INPUT.
> Emit the warnings from conf_write() and conf_write_defconfig() after
> value resolution and through the existing message callback path so the
> default behavior stays unchanged and interactive frontends remain usable.
>=20
> Document the new environment variable and add tests for both olddefconfig
> and savedefconfig.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---

Thanks a lot for this patch!  I know quite some people waiting for that
feature!  Just a minor nit-pick, and two minor issues found from
Sashiko; see below.


[...]
> @@ -759,7 +825,10 @@ int conf_write_defconfig(const char *filename)
>  {
>  	struct symbol *sym;
>  	struct menu *menu;
> +	struct gstr gs =3D str_new();
>  	FILE *out;
> +	bool warn_changed_input =3D conf_warn_changed_input_enabled();
> +	bool found =3D false;

nit-picking: I'd favor a more descriptive variable name (e.g.
'changed_input_found'), as I am expecting my future me to have to dig
into conf_warn_changed_input_enabled() what that 'found' might really
mean.


[...]
> @@ -798,6 +870,13 @@ int conf_write_defconfig(const char *filename)
>  		print_symbol_for_dotconfig(out, sym);
>  	}
>  	fclose(out);
> +
> +	conf_clear_written_flags();
> +
> +	if (found)
> +		conf_message("%s", str_get(&gs));

Sashiko complains [1] that conf_message() may truncate the output to
4096 bytes, which can easily be provoked, e.g. by switching ARCH.

[...]
> @@ -809,7 +888,10 @@ int conf_write(const char *name)
>  	const char *str;
>  	char tmpname[PATH_MAX + 1], oldname[PATH_MAX + 1];
>  	char *env;
> +	struct gstr gs =3D str_new();
>  	bool need_newline =3D false;
> +	bool warn_changed_input =3D conf_warn_changed_input_enabled();
> +	bool found =3D false;
> =20
>  	if (!name)
>  		name =3D conf_get_configname();
> @@ -859,6 +941,8 @@ int conf_write(const char *name)
>  		} else if (!sym_is_choice(sym) &&
>  			   !(sym->flags & SYMBOL_WRITTEN)) {
>  			sym_calc_value(sym);
> +			if (warn_changed_input)
> +				conf_append_changed_input_warning(&gs, sym, &found);
>  			if (!(sym->flags & SYMBOL_WRITE))
>  				goto next;

Sashiko asks about possibly duplicated warnings:
| Will duplicate warning messages be emitted for symbols that have multiple=
 menu
| entries and are forced off (so SYMBOL_WRITE is not set)?
| Since this skips the rest of the loop via goto next;, the symbol is never
| marked with SYMBOL_WRITTEN (which happens later in the block). When the m=
enu
| traversal encounters the same symbol at its next menu node, it will proce=
ss it
| again and redundantly append the exact same warning.

But from what I can find in in-tree Kconfigs, we do not have Kconfig symbols
that are accessible from multiple menu entries.  But it would be good if
someone else could check that once again.



So, thanks again for this small but great feature!

Tested-by: Nicolas Schier <nsc@kernel.org>
Reviewed-by: Nicolas Schier <nsc@kernel.org>

Thanks!


[1]: http://sashiko.dev/#/patchset/20260406233001.1-kconfig-warn-changed-in=
put-pengpeng%40iscas.ac.cn

--wm9TWPGmtFDoyYd+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmoNxboACgkQB1IKcBYm
EmnW0A//X1DFcP9L3Yi6vWlAVgwgeuv6tUS3P/LzIOzh0q03K6nUmaOUtjfi5/rN
ZKCfekxNGopRcyofRo1cLi1KfwWxkR1zhNCNJkwcIMbME6OfnnKscVN53nQUPIR5
ilUhjxu4ndaKK/6i3fYMEG7YmjLokL1aSHgakNEX40s4WgKc0QI+laWorhitK92R
1FLr8zlKyRxXTyyrraOEaSKjCf4Wp3AuN7t0Dgb6pU2oEtnuakG7W8soUoXvy+mU
mt3VSIIulQDXozuFDSW+omzQJqVI0wDlOclJpbwAR81eRYcbRpOKudJEa5XwvM2h
f3bpwICkNmvTr2FlSRbsyx3f7Q84KLqa1kF253Sv5Ao5YIEOFbgNu4M7LBw91dlN
KKSTvVpLY+mlQ5Nro5qJyfjP0vLkKqGTLrmXJgai/HY/lrJ5ZPk9HIk0z+fKd4hz
WEB5tukWS21UQyAaBVvqYkSs4b38Hbs5sKMWO3W+sbzGCt/Y6t2IZOaMqlV9x2Ct
GHqDPoXnq52uPJJU4HQ2SlcRW4NcrTjUBU4LH67C/ipk/86YXg4wbryZMmeiZwhx
15UxYEuIEgTPPTo6FFhyiho8hN6iwubBOk/MVbP9M+LcEU2ETSk3hUzQet3VUayy
FM/jKhLLiIXaKb/ARZW9LFSCQO8QVtdes/J/jChYUbepLAzgjU8=
=OvwS
-----END PGP SIGNATURE-----

--wm9TWPGmtFDoyYd+--

