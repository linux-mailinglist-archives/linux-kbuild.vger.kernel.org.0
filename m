Return-Path: <linux-kbuild+bounces-4574-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7759C205F
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2024 16:29:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F3DD1C22204
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2024 15:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E08DB206E90;
	Fri,  8 Nov 2024 15:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="XhXsCUu0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63B1206E83;
	Fri,  8 Nov 2024 15:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731079775; cv=none; b=KvOqttCdSja6iZCgSu6coD7KHe34LCsgZTM21dsexzImIF7gXU9+T/cN/lBmwTw7CC105FGVi1eVqfpaou+AkrsBXYq4QvPwBIA5NskylE4/WsTPCN0P0CykV3vjM1vsEqOxbfPvpQzPfve6oeNtTv2oLlsc58E8EB3A7Ol2qLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731079775; c=relaxed/simple;
	bh=FdYmidEN6pef1RBAjN05vJWWH3wkFrpb4Y1iaYEecN0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=YE9H0Hh+7Oq4qbWnThCd4cLxB9jjZr+BCcslsaE6AHmOXzyapPJEQChXV9s+EBNq81Ldv9Cjim4XugeZSvS8xaLdgb+UzRFvpFBHIZbyywsraWIg9gAk8+rnRQbOIAMaGcEQqI202+wa1o+Lc2eSRTDhDIXDq/kOrAbXR6aQRxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=XhXsCUu0; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from [127.0.0.1] ([90.224.241.145])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 4A8FT6qU1649581
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 8 Nov 2024 07:29:08 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 4A8FT6qU1649581
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2024101701; t=1731079750;
	bh=pnUsq2xOT/zzKZ55JOzG2idp9Hoat/i/RT2lXBd5mIk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=XhXsCUu0QGwmZXvUNBLr4xCgoWoOiIQT20CXEmO30jyWQ4vkcBRZcPjd37DDoepd9
	 +haCKXwK0Z6A3UinGUeGpggJ0a6JmHzj/1gXwtWPx8/IYcEYhtLRn5AWKftGOWeppV
	 l3xs0yD8bXuvaQ7tRDPcZFID2loCp1mINnyOXVjINF9pMBkGSPViVcP568f+PQYRG1
	 oURkiHGtSKfYrcYedQ4PJf1cs7fMUMPXnLoobuWB9PJ9HRzEUNT7oDB3WoM1A2fbix
	 eIAw43luHS84BuVoez8FpVLmwUo4PIe+JSbRNL2Q1DxOhHgqp4zVsCIv04iiAew7VD
	 gOsDrflCyZ3Fw==
Date: Fri, 08 Nov 2024 16:28:58 +0100
From: "H. Peter Anvin" <hpa@zytor.com>
To: Peter Zijlstra <peterz@infradead.org>, mcgrof@kernel.org
CC: x86@kernel.org, petr.pavlu@suse.com, samitolvanen@google.com,
        da.gomez@samsung.com, masahiroy@kernel.org, nathan@kernel.org,
        nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
        hch@infradead.org, gregkh@linuxfoundation.org
Subject: Re: [RFC] module: Strict per-modname namespaces
User-Agent: K-9 Mail for Android
In-Reply-To: <20241106190240.GR10375@noisy.programming.kicks-ass.net>
References: <20241106190240.GR10375@noisy.programming.kicks-ass.net>
Message-ID: <04F6A88E-FC15-4184-A1F7-A5EE443997DD@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On November 6, 2024 8:02:40 PM GMT+01:00, Peter Zijlstra <peterz@infradead=
=2Eorg> wrote:
>Hi,
>
>I've been wanting $topic for a while, and having just stumbled into the
>whole namespace thing by accident, I figured I'd give it a go, most if
>the hard parts seem to have already been done=2E
>
>It reserves and disallows imports on any "MODULE_${name}" namespace,
>while it implicitly adds the same namespace to every module=2E
>
>This allows exports targeted at specific modules and no others -- one
>random example included=2E I've hated the various kvm exports we've had
>for a while, and strictly limiting them to the kvm module helps
>alleviate some abuse potential=2E
>
>---
> arch/x86/kernel/fpu/core=2Ec |  2 +-
> kernel/module/main=2Ec       | 28 ++++++++++++++++++++++++++--
> scripts/mod/modpost=2Ec      | 29 ++++++++++++++++++++---------
> 3 files changed, 47 insertions(+), 12 deletions(-)
>
>diff --git a/arch/x86/kernel/fpu/core=2Ec b/arch/x86/kernel/fpu/core=2Ec
>index 1209c7aebb21=2E=2E23b188a53d9d 100644
>--- a/arch/x86/kernel/fpu/core=2Ec
>+++ b/arch/x86/kernel/fpu/core=2Ec
>@@ -366,7 +366,7 @@ int fpu_swap_kvm_fpstate(struct fpu_guest *guest_fpu,=
 bool enter_guest)
> 	fpregs_unlock();
> 	return 0;
> }
>-EXPORT_SYMBOL_GPL(fpu_swap_kvm_fpstate);
>+EXPORT_SYMBOL_NS_GPL(fpu_swap_kvm_fpstate, MODULE_kvm);
>=20
> void fpu_copy_guest_fpstate_to_uabi(struct fpu_guest *gfpu, void *buf,
> 				    unsigned int size, u64 xfeatures, u32 pkru)
>diff --git a/kernel/module/main=2Ec b/kernel/module/main=2Ec
>index 49b9bca9de12=2E=2Eb30af879c2cb 100644
>--- a/kernel/module/main=2Ec
>+++ b/kernel/module/main=2Ec
>@@ -1070,6 +1070,13 @@ static int verify_namespace_is_imported(const stru=
ct load_info *info,
>=20
> 	namespace =3D kernel_symbol_namespace(sym);
> 	if (namespace && namespace[0]) {
>+		/*
>+		 * Implicitly import MODULE_${mod->name} namespace=2E
>+		 */
>+		if (strncmp(namespace, "MODULE_", 7) =3D=3D 0 &&
>+		    strcmp(namespace+7, mod->name) =3D=3D 0)
>+			return 0;
>+
> 		for_each_modinfo_entry(imported_namespace, info, "import_ns") {
> 			if (strcmp(namespace, imported_namespace) =3D=3D 0)
> 				return 0;
>@@ -1613,15 +1620,30 @@ static void module_license_taint_check(struct mod=
ule *mod, const char *license)
> 	}
> }
>=20
>-static void setup_modinfo(struct module *mod, struct load_info *info)
>+static int setup_modinfo(struct module *mod, struct load_info *info)
> {
> 	struct module_attribute *attr;
>+	char *imported_namespace;
> 	int i;
>=20
> 	for (i =3D 0; (attr =3D modinfo_attrs[i]); i++) {
> 		if (attr->setup)
> 			attr->setup(mod, get_modinfo(info, attr->attr=2Ename));
> 	}
>+
>+	for_each_modinfo_entry(imported_namespace, info, "import_ns") {
>+		/*
>+		 * 'MODULE_' prefixed namespaces are implicit, disallow
>+		 * explicit imports=2E
>+		 */
>+		if (strstarts(imported_namespace, "MODULE_")) {
>+			pr_err("%s: module tries to import module namespace: %s\n",
>+			       mod->name, imported_namespace);
>+			return -EPERM;
>+		}
>+	}
>+
>+	return 0;
> }
>=20
> static void free_modinfo(struct module *mod)
>@@ -2935,7 +2957,9 @@ static int load_module(struct load_info *info, cons=
t char __user *uargs,
> 		goto free_unload;
>=20
> 	/* Set up MODINFO_ATTR fields */
>-	setup_modinfo(mod, info);
>+	err =3D setup_modinfo(mod, info);
>+	if (err)
>+		goto free_modinfo;
>=20
> 	/* Fix up syms, so that st_value is a pointer to location=2E */
> 	err =3D simplify_symbols(mod, info);
>diff --git a/scripts/mod/modpost=2Ec b/scripts/mod/modpost=2Ec
>index 107393a8c48a=2E=2Ed1de3044ee03 100644
>--- a/scripts/mod/modpost=2Ec
>+++ b/scripts/mod/modpost=2Ec
>@@ -1553,8 +1553,19 @@ static void mod_set_crcs(struct module *mod)
> 	free(buf);
> }
>=20
>+static const char *mod_basename(const char *modname)
>+{
>+	const char *basename =3D strrchr(modname, '/');
>+	if (basename)
>+		basename++;
>+	else
>+		basename =3D modname;
>+	return basename;
>+}
>+
> static void read_symbols(const char *modname)
> {
>+	char module_namespace[MODULE_NAME_LEN + 8];
> 	const char *symname;
> 	char *version;
> 	char *license;
>@@ -1586,12 +1597,16 @@ static void read_symbols(const char *modname)
> 			license =3D get_next_modinfo(&info, "license", license);
> 		}
>=20
>-		namespace =3D get_modinfo(&info, "import_ns");
>-		while (namespace) {
>+		for (namespace =3D get_modinfo(&info, "import_ns"); namespace;
>+		     namespace =3D get_next_modinfo(&info, "import_ns", namespace)) {
>+			if (strstarts(namespace, "MODULE_"))
>+				error("importing implicit module namespace: %s\n", namespace);
>+
> 			add_namespace(&mod->imported_namespaces, namespace);
>-			namespace =3D get_next_modinfo(&info, "import_ns",
>-						     namespace);
> 		}
>+		snprintf(module_namespace, sizeof(module_namespace), "MODULE_%s",
>+			 mod_basename(mod->name));
>+		add_namespace(&mod->imported_namespaces, module_namespace);
>=20
> 		if (extra_warn && !get_modinfo(&info, "description"))
> 			warn("missing MODULE_DESCRIPTION() in %s\n", modname);
>@@ -1700,11 +1715,7 @@ static void check_exports(struct module *mod)
> 		s->crc_valid =3D exp->crc_valid;
> 		s->crc =3D exp->crc;
>=20
>-		basename =3D strrchr(mod->name, '/');
>-		if (basename)
>-			basename++;
>-		else
>-			basename =3D mod->name;
>+		basename =3D mod_basename(mod->name);
>=20
> 		if (!contains_namespace(&mod->imported_namespaces, exp->namespace)) {
> 			modpost_log(!allow_missing_ns_imports,

I presume this only applies to code compiled as dynamic modules, not compi=
led into the kernel?

