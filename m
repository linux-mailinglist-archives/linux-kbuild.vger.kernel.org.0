Return-Path: <linux-kbuild+bounces-5337-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 51774A008F8
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 12:57:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE2C17A19E3
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 11:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462AA1EE028;
	Fri,  3 Jan 2025 11:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="fqVhtN+V"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39D41F9A96;
	Fri,  3 Jan 2025 11:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735905417; cv=none; b=Z6IQc6hX03FpSR482I8P6oNGEJ627RqyoHWuNh2BamUWtwpykDL2wb0o+LlAh3yT0bASkrL5KRBq4Obv4sp0b7v+tYiOQrAeoQu7S1gaTqFucKmNxhL+ETDIqa78AWGeOEmLS/FgBENpUFkJzq1AAhUZcvTP0+S85xzs5mB+d6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735905417; c=relaxed/simple;
	bh=jmX7hWGP5oSGPljBJB57p1QPGjlIqjCAAibLpskOGgM=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=epRri4tTUl8IwM+PZIsO5c74znn0v3Gu2oSbW4rkYgNRnmXMj0f+MTdEUO5bEKMlJB8qeUgORK+pGMfDQvbu6uyCwM0Qq1P96ARyIc0YIrMV5PhZZDLM+ui95May6n0/DIzgnX9qafaKMCbNL9KpRL2TAjmM/Bz6KqCs4jxtf/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=fqVhtN+V; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1735905394; x=1736510194; i=markus.elfring@web.de;
	bh=6KwzK1eNGlN0poi/02bIQefuq1gDxGxWou+nA4lnS4E=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=fqVhtN+VLGzsT0QekHmVwyCMiOxevaDfOnyuIzgofNd1VWbV9aiWTt4mhEurbhXR
	 orSVhhNNMYrhaSK6sP+FCOs8I5wZZ2+GjDnGUAQl0XEr6HwQNL/sIvv2vLqqLw/y0
	 3ERJqqTCaIQ58QgGMV62gK3VvUmIlT3bL6wceB4qYyFoumBi3q/ZM8CnWB4Zs/Jah
	 eoO8uWTxY3cpC4jWq4tK6kmzcReQYWWBfFcVizoS0DDlnBPWEuL8NEhrLnNtF5LfF
	 6V9Yz0iocpKBapQT9NqNO1sF0rTZIIlCDAaPLrqQwU+KAwvSnEtueE05u3Zv5ruxS
	 FGhPBehknmJwVrC+fA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.37]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MRF3W-1t6V6M3BkS-00LwAG; Fri, 03
 Jan 2025 12:56:34 +0100
Message-ID: <bef30d4b-8d43-4595-ac11-53526723ea34@web.de>
Date: Fri, 3 Jan 2025 12:56:32 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?=
 <agruen@suse.de>, Andrew Morton <akpm@linux-foundation.org>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20250103073046.2609911-1-masahiroy@kernel.org>
Subject: Re: [PATCH 1/6] genksyms: fix memory leak when the same symbol is
 added from source
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250103073046.2609911-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:aDaGI4PHfs0XRdSYYggoVlJVL3nHX0D/vB6e4vchkrxsK7rCmQq
 Fsy9JBix8qI9po/06gSvOOw3z9RDm/LmwgS/CQZYhGqMMtbBbaRtcXvMtbb8VeqZpmegDBs
 KMk8vLD11/HsnS6xuNXPatslTP9YdyN7ermdG/HlLu7KgEJiJpSC0ZJOT6fW2tW9SEyQsZF
 d4CHlEhecInXcEPbSLWCQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Zw6JKyAfOig=;hoaUFafPD2GPJqT7qpOr0LMlRAi
 MfSc999uSEjhCu9PVNZZJfGSf3fpZiHWKvp/QPwGgv/EF8QfgGvZh1M1NPGDtwR+Ch2srcUl5
 Z601r0bR9tJoUZMN24mxoRo8Kby0b7rT4ctxibrCuWJ32+oMY9psLfXz9ZSzENaR+BVuk5I4f
 v6jw+5v9Grdgpj0m/qZIMVm+xYtbw/u36z09ucKSPMZJPmdB1s9jp63WSKbUzMZ0gQAHia+Fh
 s7IrA6/VPds/Y8KY6G9NapcE/Svh0vP+GemY7h9bOwtGxA3a7YCW91+jmDuUynXLXsB7PDr34
 Q2jmSRJL/GcM0S1ElXP9ZW6131BXJXpyySFqAIuczMKPCJdt7wYVBToKLkcvDEJu7rW5v5bQJ
 OUJ2CckrEfXVh1puf0JWV1Nw6QGENk/Fct1//SefDfQCnY/bECS1xVL0yDa0O3YPqsOHaTysH
 8+56BxWzbuas0Cl+xGyzXE10ZsblvE7woW+TtF4qlsEn+USvdJs89Dtyx/0LMIAzKxUN4B8Xj
 ZaSe9B1cTw9F/eXnnDS9ZCgIb8kPwzmuQXLs/m9wHA20t+fQg3Pqn3tm753/DLixNjwoIRIYo
 cMA1sSXcLW9sIgZxaskAFj5SWdsHOPZ0gjDuEzDjHELVPuz9dIMEV6FQ/uKlDHpYQpiSu1NME
 MIprH+M3rJ8keIFok+q31rWXB8i8GGZqk6q/BFJPS/jG5IaSNhoRQnZD+9B64LLXijzExI1Dw
 NaS1dqHdAYyai2Vid3su23GAYB8WHWx4a/PFA84CJHA16J6CaumbNgkR41f5F7oT2sIWRhu/y
 8/44tZvxfn3VeY7gDTp8EJY8iKdM9tHbUhs3Y127ppI7+hl3OGDfxTmLGd3wVLaNBqPgUZlzV
 GIRG0U626iNlp3p67ziDVO7aO4g+utJuyEv7lxt3Ylau0qot8bg3O4QrfDFGzFd7/IOHVrg/7
 RJ+41BUPsjQ3S7RXCebGs9aZaFA/pCA6Rul5HCateaL6R14C9FAxfWkPTJjqA3n0Mwozw3/nc
 0KcaRznhbXsWEMihEL93ZoWYHpeI+kCaE8pbOa102kmc0EIqYvipAlUctKKZ0+OjsLW3GUTCU
 Qe/5xatXI=

=E2=80=A6
> +++ b/scripts/genksyms/genksyms.c
> @@ -239,6 +239,7 @@ static struct symbol *__add_symbol(const char *name,=
 enum symbol_type type,
>  						"unchanged\n");
>  				}
>  				sym->is_declared =3D 1;
> +				free_list(defn, NULL);
>  				return sym;
>  			} else if (!sym->is_declared) {
>  				if (sym->is_override && flag_preserve) {
=E2=80=A6

Would you like to complete the data processing by using a corresponding go=
to chain?

Regards,
Markus

