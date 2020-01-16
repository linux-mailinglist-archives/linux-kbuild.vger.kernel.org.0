Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57B0713D15C
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Jan 2020 01:57:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729064AbgAPA5w (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 15 Jan 2020 19:57:52 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:33349 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726310AbgAPA5w (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Jan 2020 19:57:52 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
        id 47ym581jzNz9sR0; Thu, 16 Jan 2020 11:57:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1579136268;
        bh=NFWvXfvHC7UESUpRUwyZiWw9YmMUD96laMG2kvm+8QA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZPeO/qK4XhPI8W819KTOvE+cwkwGFXZK4tJT8MyspF3I/AB1QWDzu4z25p+iMtF/S
         m0rwJw5FHXlbWQUiXE5EfCQuDDhNkY0vnsrXqqdm+DwlKOLkZTHPhha5u2IUT+I4rZ
         dgMbeYHBGonofYnUPAFRMZltYelNKcHTNbmsnHX0=
Date:   Thu, 16 Jan 2020 10:57:41 +1000
From:   David Gibson <david@gibson.dropbear.id.au>
To:     Alexandre Torgue <alexandre.torgue@st.com>
Cc:     robh+dt@kernel.org, Frank Rowand <frowand.list@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>, sjg@chromium.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org
Subject: Re: [RFC PATCH 1/3] dtc: Add dtb build information option
Message-ID: <20200116005741.GB54439@umbus>
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <20200113181625.3130-2-alexandre.torgue@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gj572EiMnwbLXET9"
Content-Disposition: inline
In-Reply-To: <20200113181625.3130-2-alexandre.torgue@st.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--gj572EiMnwbLXET9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 07:16:23PM +0100, Alexandre Torgue wrote:
> This commit adds the possibility to add build information for a DTB.
> Build information can be: build date, DTS version, "who built the DTB"
> (same kind of information that we get in Linux with the Linux banner).
>=20
> To do this, an extra option "-B" using an information file as argument
> has been added. If this option is used, input device tree is appended with
> a new string property "Build-info". This property is built with informati=
on
> found in information file given as argument. This file has to be generated
> by user and shouldn't exceed 256 bytes.
>=20
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

At the very least, this patch of the series will need to be sent to
upstream dtc first.

I'm also not terribly clear on what you're trying to accomplish here,
and why it's useful.

Since you're doing this specifically for use with dtbs built in the
kernel build, could you just use a:
	Build-info =3D /incbin/ "build-info.txt";
in each of the in-kernel .dts files?

Altough you probably shouldn't use "Build-info" since it doesn't match
device tree property naming conventions.  My suggestion would be
"linux,build-info".

> diff --git a/scripts/dtc/dtc.c b/scripts/dtc/dtc.c
> index bdb3f5945699..294828bac20b 100644
> --- a/scripts/dtc/dtc.c
> +++ b/scripts/dtc/dtc.c
> @@ -18,6 +18,7 @@ int padsize;		/* Additional padding to blob */
>  int alignsize;		/* Additional padding to blob accroding to the alignsize=
 */
>  int phandle_format =3D PHANDLE_EPAPR;	/* Use linux,phandle or phandle pr=
operties */
>  int generate_symbols;	/* enable symbols & fixup support */
> +int generate_build_info;	/* Add build information: time, source version =
=2E.. */
>  int generate_fixups;		/* suppress generation of fixups on symbol support=
 */
>  int auto_label_aliases;		/* auto generate labels -> aliases */
>  int annotate;		/* Level of annotation: 1 for input source location
> @@ -45,9 +46,42 @@ static void fill_fullpaths(struct node *tree, const ch=
ar *prefix)
>  		fill_fullpaths(child, tree->fullpath);
>  }
> =20
> +static void fill_build_info(struct node *tree, const char *fname)
> +{
> +	struct data d =3D empty_data;
> +	char *tmp;
> +	FILE *f;
> +	int len;
> +
> +	tmp =3D xmalloc(sizeof(char) * 256);
> +
> +	f =3D fopen(fname, "r");
> +	if (!f) {
> +		printf("Can't open file %s\n", fname);
> +		return;
> +	}
> +
> +	len =3D fread(tmp, sizeof(char), 256, f);
> +	if (!len) {
> +		printf("Can't read file %s\n", fname);
> +		fclose(f);
> +		free(tmp);
> +	}
> +	fclose(f);

You have no useful error reporting if the file is larger than the limit.

> +
> +	tmp[len - 1] =3D '\0';
> +
> +	d =3D data_add_marker(d, TYPE_STRING, tmp);
> +	d =3D data_append_data(d, tmp, len);

You can essentially do this better with data_copy_file().

> +
> +	add_property(tree, build_property("Build-info", d, NULL));
> +
> +	free(tmp);
> +}
> +
>  /* Usage related data. */
>  static const char usage_synopsis[] =3D "dtc [options] <input file>";
> -static const char usage_short_opts[] =3D "qI:O:o:V:d:R:S:p:a:fb:i:H:sW:E=
:@AThv";
> +static const char usage_short_opts[] =3D "qI:O:o:V:d:R:S:p:a:fb:i:H:sW:E=
:@AT:B:hv";
>  static struct option const usage_long_opts[] =3D {
>  	{"quiet",            no_argument, NULL, 'q'},
>  	{"in-format",         a_argument, NULL, 'I'},
> @@ -69,6 +103,7 @@ static struct option const usage_long_opts[] =3D {
>  	{"symbols",	     no_argument, NULL, '@'},
>  	{"auto-alias",       no_argument, NULL, 'A'},
>  	{"annotate",         no_argument, NULL, 'T'},
> +	{"build-info",	      a_argument, NULL, 'B'},
>  	{"help",             no_argument, NULL, 'h'},
>  	{"version",          no_argument, NULL, 'v'},
>  	{NULL,               no_argument, NULL, 0x0},
> @@ -106,6 +141,7 @@ static const char * const usage_opts_help[] =3D {
>  	"\n\tEnable generation of symbols",
>  	"\n\tEnable auto-alias of labels",
>  	"\n\tAnnotate output .dts with input source file and line (-T -T for mo=
re details)",
> +	"\n\tAdd build information (date, version, ...) in the blob",
>  	"\n\tPrint this help and exit",
>  	"\n\tPrint version and exit",
>  	NULL,
> @@ -164,6 +200,7 @@ int main(int argc, char *argv[])
>  	const char *outform =3D NULL;
>  	const char *outname =3D "-";
>  	const char *depname =3D NULL;
> +	const char *version =3D NULL;
>  	bool force =3D false, sort =3D false;
>  	const char *arg;
>  	int opt;
> @@ -256,9 +293,12 @@ int main(int argc, char *argv[])
>  		case 'T':
>  			annotate++;
>  			break;
> -
>  		case 'h':
>  			usage(NULL);
> +		case 'B':
> +			version =3D optarg;
> +			generate_build_info =3D 1;
> +			break;
>  		default:
>  			usage("unknown option");
>  		}
> @@ -296,14 +336,17 @@ int main(int argc, char *argv[])
>  	}
>  	if (annotate && (!streq(inform, "dts") || !streq(outform, "dts")))
>  		die("--annotate requires -I dts -O dts\n");
> -	if (streq(inform, "dts"))
> +	if (streq(inform, "dts")) {
>  		dti =3D dt_from_source(arg);
> -	else if (streq(inform, "fs"))
> +		if (generate_build_info)
> +			fill_build_info(dti->dt, version);
> +	} else if (streq(inform, "fs")) {
>  		dti =3D dt_from_fs(arg);
> -	else if(streq(inform, "dtb"))
> +	} else if (streq(inform, "dtb")) {
>  		dti =3D dt_from_blob(arg);
> -	else
> +	} else {
>  		die("Unknown input format \"%s\"\n", inform);
> +	}
> =20
>  	dti->outname =3D outname;
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gj572EiMnwbLXET9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4ftQIACgkQbDjKyiDZ
s5KzNhAA4xu6t0uG6xcZ/G1wNX3HVW1UGJ7aleePRrxOTUFMG3568GE/Cnbj3RmG
Y8Is7j9vRJb53GgE4EFPxgneVXzKviAXP7R8cy8AEBzM3esnmleq8WC3bUCQY4AC
mVHpsRk1GuAjYdsoXF+k1CSA5agjt5RUlsv/pNFPFfISKck1AuYz+yLt24INAzZH
yH+aJMohYZbGq6PYZUPtK/CHZEo7KFP+YdMq214JU4P/zrMc0tQ+auuYDwVBwBBP
7WsuO/agnc+wklSlhjdGXFj48X2ALThqxJzYwYZSPXA0waWngdqDOvHVaufw454K
CMm0ISit01OEszGWN6Mh7HZmco2b3w4rrN3Gxvg/BChGBkBEkZw8VqetVHWiEIPi
JgjaB3FZQ4vkdOGZQ38OO/gcfkSYn9n9Aq8pVg1YhHcggL3jHqEbRXOe9TK1tU8B
QzDbrpYdfGpctnR2aO9bY3znUNNZ4F4UGObX5JBSHR7TnFed2mxC4SN/j/8wRlE4
gH3BhM+4Kbjy9C6q9fcSb+6AaJrg5yTzeJLLiyvdVIhaF0iGNeydE1F9GjdnOhwr
bhSaaBqB97qsAszfuN+Moxr4BrVuZePxl+oEy/QdOt+U4MB1cSLQxGl9xlz+J53d
V5PF3y2VyfcJrX7I28GY2sGpu2ocWPsXP+7to/G/lxZargPS5/0=
=4txu
-----END PGP SIGNATURE-----

--gj572EiMnwbLXET9--
